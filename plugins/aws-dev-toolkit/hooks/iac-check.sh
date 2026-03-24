#!/bin/bash
# Only remind about IaC validation when the edited file is actually an IaC file.
# Receives tool arguments as JSON via $TOOL_INPUT.

FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"file_path"\s*:\s*"[^"]+"' | head -1 | sed 's/.*: *"//;s/"$//')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

BASENAME=$(basename "$FILE_PATH")

case "$BASENAME" in
  *.tf|*.tfvars)
    echo "IaC file edited: $BASENAME — consider running: terraform validate && terraform plan"
    ;;
  template.yaml|template.yml)
    echo "IaC file edited: $BASENAME — consider running: sam validate or aws cloudformation validate-template"
    ;;
  *-stack.ts|*-stack.py)
    echo "IaC file edited: $BASENAME — consider running: cdk synth && cdk diff"
    ;;
  *.template.json)
    echo "IaC file edited: $BASENAME — consider running: aws cloudformation validate-template"
    ;;
  *)
    # Not an IaC file — no output, no interruption
    ;;
esac
