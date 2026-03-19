# sup-virtual-sa

A Claude Code plugin marketplace for AWS development. Ships skills, sub-agents, MCP servers, and hooks that help you build well-architected applications on AWS.

## Quick Start

```bash
# Add the marketplace
/plugin marketplace add <your-git-url>

# Install the AWS dev toolkit
/plugin install aws-dev-toolkit@sup-virtual-sa
```

Or test locally during development:

```bash
claude --plugin-dir ./plugins/aws-dev-toolkit
```

## What's Included

### Plugins

#### `aws-dev-toolkit`

**Skills:**
| Skill | Trigger | Description |
|---|---|---|
| `aws-architect` | Auto | Design & review AWS architectures against Well-Architected Framework |
| `iac-scaffold` | `/iac-scaffold <framework> <description>` | Scaffold CDK, Terraform, SAM, or CloudFormation projects |
| `aws-debug` | Auto | Debug AWS deployment failures, Lambda errors, permission issues |
| `cost-check` | Auto | Analyze and optimize AWS costs |
| `security-review` | Auto | Audit IaC and AWS configs for security issues |

**Sub-Agents:**
| Agent | Model | Description |
|---|---|---|
| `aws-explorer` | Haiku | Read-only AWS environment exploration and context gathering |
| `iac-reviewer` | Sonnet | Reviews IaC changes for correctness, security, and best practices |

**MCP Servers:**
| Server | Package | Description |
|---|---|---|
| `aws-iac` | `awslabs.aws-iac-mcp-server` | CDK/Terraform/CloudFormation development with security scanning |
| `aws-docs` | `awslabs.aws-documentation-mcp-server` | Latest AWS documentation and code samples |
| `aws-core` | `awslabs.core-mcp-server` | Proxy server that dynamically imports other AWS MCP servers |
| `aws-cost` | `awslabs.cost-analysis-mcp-server` | Cost analysis and optimization |

**Hooks:**
- Post-edit reminder to validate IaC files before deploying

## Prerequisites

- [Claude Code](https://code.claude.com) v1.0.33+
- [uv](https://docs.astral.sh/uv/getting-started/installation/) (for MCP servers via `uvx`)
- AWS CLI configured with appropriate credentials
- (Optional) `checkov`, `cfn-nag`, `tfsec` for security scanning

## Project Structure

```
sup-virtual-sa/
├── .claude-plugin/
│   └── marketplace.json          # Marketplace catalog
├── plugins/
│   └── aws-dev-toolkit/          # First plugin
│       ├── .claude-plugin/
│       │   └── plugin.json       # Plugin manifest
│       ├── .mcp.json             # MCP server configs
│       ├── skills/               # Agent skills
│       │   ├── aws-architect/
│       │   ├── iac-scaffold/
│       │   ├── aws-debug/
│       │   ├── cost-check/
│       │   └── security-review/
│       ├── agents/               # Sub-agents
│       │   ├── aws-explorer.md
│       │   └── iac-reviewer.md
│       └── hooks/
│           └── hooks.json
└── README.md
```

## Adding More Plugins

This marketplace is designed to host multiple plugins. To add a new one:

1. Create a directory under `plugins/<your-plugin-name>/`
2. Add `.claude-plugin/plugin.json` with the manifest
3. Add your skills, agents, hooks, and MCP configs
4. Register it in `.claude-plugin/marketplace.json`

## Available AWS MCP Servers

The [awslabs/mcp](https://awslabs.github.io/mcp/servers) project provides 60+ official MCP servers. Some notable ones to consider adding:

| Server | Use Case |
|---|---|
| `awslabs.aws-api-mcp-server` | Direct AWS API access via CLI |
| `awslabs.cdk-mcp-server` | CDK-specific development |
| `awslabs.terraform-mcp-server` | Terraform-specific workflows |
| `awslabs.lambda-mcp-server` | Lambda function management |
| `awslabs.s3-mcp-server` | S3 operations |
| `awslabs.cloudformation-mcp-server` | CloudFormation resource management |
| `awslabs.bedrock-mcp-server` | Bedrock AI model integration |
| `awslabs.cloudwatch-mcp-server` | Metrics, alarms, and log analysis |
| `awslabs.iam-mcp-server` | IAM user, role, and policy management |
| `awslabs.well-architected-mcp-server` | Well-Architected Framework reviews |

## License

MIT
