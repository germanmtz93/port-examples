# Port Examples Repository

This repository contains example implementations and workflows demonstrating how to integrate [Port](https://getport.io/) with various infrastructure and development tools. Port is a developer portal that helps teams manage their software catalog, developer experience, and operational workflows.

## 🏗️ Repository Structure

```
port-examples/
├── .github/workflows/          # GitHub Actions workflows
│   ├── create-an-ec2-instance.yaml    # EC2 instance provisioning workflow
│   ├── create-repo-secret.yml         # GitHub secret creation workflow
│   └── create-test-repo.yml           # Repository creation workflow
├── ec2-sample-deploy/          # Terraform infrastructure code
│   ├── main.tf                 # Main Terraform configuration
│   ├── variables.tf            # Variable definitions
│   └── outputs.tf              # Output definitions
└── README.md                   # This file
```

## 🚀 Features

### 1. EC2 Instance Provisioning
- **Location**: `ec2-sample-deploy/`
- **Purpose**: Demonstrates how to provision AWS EC2 instances using Terraform
- **Integration**: Includes Port workflow integration for tracking and logging

### 2. GitHub Repository Management
- **Workflow**: `create-test-repo.yml`
- **Purpose**: Creates new GitHub repositories via GitHub API
- **Integration**: Reports success/failure back to Port

### 3. Secret Management
- **Workflow**: `create-repo-secret.yml`
- **Purpose**: Creates GitHub repository secrets
- **Integration**: Tracks secret creation in Port catalog

## 🛠️ Prerequisites

Before using this repository, ensure you have:

- **AWS Account**: With appropriate permissions for EC2 instance creation
- **GitHub Account**: With Personal Access Token for repository operations
- **Port Account**: With configured client ID and secret
- **Terraform**: Version 1.0+ installed locally (for development)

## 🔧 Setup Instructions

### 1. Port Configuration

Set up the following secrets in your GitHub repository:

```bash
# Required for Port integration
PORT_CLIENT_ID=your_port_client_id
PORT_CLIENT_SECRET=your_port_client_secret

# Required for AWS operations
TF_USER_AWS_KEY=your_aws_access_key
TF_USER_AWS_SECRET=your_aws_secret_key
TF_USER_AWS_REGION=your_aws_region

# Required for GitHub operations
PERSONAL_ACCESS_TOKEN=your_github_pat
```

### 2. AWS Configuration

Ensure your AWS credentials have the following permissions:
- EC2: Create, describe, and tag instances
- IAM: Read access for instance metadata
- VPC: Read access for network configuration

### 3. Terraform Setup

Navigate to the `ec2-sample-deploy/` directory and configure your variables:

```bash
cd ec2-sample-deploy
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

## 📖 Usage Examples

### Provisioning an EC2 Instance

1. **Manual Trigger**: Go to Actions → "Provision AN EC2 Instance" → Run workflow
2. **Input Parameters**:
   - `ec2_name`: Name for your EC2 instance
   - `ec2_instance_type`: AWS instance type (default: t3.micro)
   - `pem_key_name`: Name of your AWS key pair
   - `port_context`: Port context JSON (automatically provided)

### Creating a GitHub Repository

1. **Manual Trigger**: Go to Actions → "Create Test Repo" → Run workflow
2. **Input Parameters**:
   - `repo_name`: Name for the new repository
   - `port_context`: Port context JSON (automatically provided)

### Managing Repository Secrets

1. **Manual Trigger**: Go to Actions → "Create Repository Secret" → Run workflow
2. **Input Parameters**:
   - `secret_key`: Name of the secret
   - `secret_value`: Value of the secret
   - `port_context`: Port context JSON (automatically provided)

## 🔍 Terraform Configuration

The Terraform configuration in `ec2-sample-deploy/` creates:

- **EC2 Instance**: Ubuntu 20.04 LTS with configurable instance type
- **Tags**: Custom naming and identification
- **Outputs**: Comprehensive instance information for Port integration

### Key Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `ec2_name` | Name tag for the EC2 instance | Yes | - |
| `pem_key_name` | AWS key pair name for SSH access | Yes | - |
| `aws_region` | AWS region for deployment | Yes | - |
| `ec2_instance_type` | EC2 instance type | No | t3.micro |

## 🔄 Port Integration

All workflows in this repository integrate with Port to:

- **Track Operations**: Log start/completion of infrastructure operations
- **Catalog Management**: Automatically create/update entities in Port catalog
- **Audit Trail**: Maintain complete history of infrastructure changes
- **Status Reporting**: Report success/failure back to Port workflows

## 🧪 Testing

### Local Terraform Testing

```bash
cd ec2-sample-deploy
terraform init
terraform validate
terraform plan
```

### Workflow Testing

1. Use the "Run workflow" feature in GitHub Actions
2. Monitor execution in the Actions tab
3. Check Port dashboard for entity updates

## 📝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 🐛 Troubleshooting

### Common Issues

1. **AWS Credentials**: Ensure `TF_USER_AWS_KEY` and `TF_USER_AWS_SECRET` are set correctly
2. **Port Integration**: Verify `PORT_CLIENT_ID` and `PORT_CLIENT_SECRET` are valid
3. **GitHub Permissions**: Ensure `PERSONAL_ACCESS_TOKEN` has appropriate repository permissions
4. **Terraform State**: Check for existing Terraform state conflicts

### Debug Steps

1. Check GitHub Actions logs for detailed error messages
2. Verify all required secrets are configured
3. Test Terraform commands locally
4. Check Port dashboard for integration issues

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Support

For support and questions:

- **Port Documentation**: [https://docs.getport.io/](https://docs.getport.io/)
- **GitHub Issues**: Create an issue in this repository
- **Port Community**: Join the [Port community](https://community.getport.io/)

## 🔗 Related Resources

- [Port Official Documentation](https://docs.getport.io/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
