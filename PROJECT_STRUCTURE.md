# Project Structure

This document provides a detailed overview of the repository structure, explaining the purpose and organization of each component.

## 📁 Root Directory

```
port-examples/
├── .github/                    # GitHub-specific configurations
├── ec2-sample-deploy/          # Terraform infrastructure code
├── .gitignore                  # Git ignore patterns
├── CHANGELOG.md               # Version history and changes
├── CONTRIBUTING.md            # Contribution guidelines
├── LICENSE                    # MIT License
├── Makefile                   # Development automation commands
├── PROJECT_STRUCTURE.md       # This file
├── QUICKSTART.md              # Quick start guide
└── README.md                  # Main project documentation
```

## 🔧 Configuration Files

### `.gitignore`
- **Purpose**: Specifies which files Git should ignore
- **Key Patterns**:
  - Terraform state files and directories
  - Environment variables and secrets
  - IDE and OS-specific files
  - Node.js dependencies and build artifacts

### `Makefile`
- **Purpose**: Provides common development commands
- **Key Commands**:
  - `make help`: Show available commands
  - `make init`: Initialize Terraform
  - `make plan`: Plan Terraform changes
  - `make apply`: Apply Terraform changes
  - `make validate`: Validate Terraform configuration
  - `make clean`: Clean up temporary files

## 📚 Documentation Files

### `README.md`
- **Purpose**: Main project documentation and entry point
- **Contents**:
  - Project overview and features
  - Setup instructions
  - Usage examples
  - Troubleshooting guide
  - Contributing information

### `QUICKSTART.md`
- **Purpose**: Step-by-step setup guide for new users
- **Contents**:
  - Prerequisites checklist
  - Quick setup steps
  - Common use cases
  - Troubleshooting tips

### `CONTRIBUTING.md`
- **Purpose**: Guidelines for contributors
- **Contents**:
  - How to contribute
  - Coding standards
  - Testing requirements
  - Commit message format
  - Release process

### `CHANGELOG.md`
- **Purpose**: Track version history and changes
- **Contents**:
  - Version releases
  - Change categories (Added, Fixed, etc.)
  - Contributing guidelines for changelog

### `PROJECT_STRUCTURE.md`
- **Purpose**: This file - explains project organization
- **Contents**:
  - Directory structure
  - File purposes
  - Component relationships

### `LICENSE`
- **Purpose**: MIT License for the project
- **Scope**: Covers all code and documentation

## 🏗️ Infrastructure Code

### `ec2-sample-deploy/` Directory

```
ec2-sample-deploy/
├── main.tf                    # Main Terraform configuration
├── variables.tf               # Variable definitions
├── outputs.tf                 # Output definitions
├── versions.tf                # Version constraints
└── terraform.tfvars.example   # Example configuration
```

#### `main.tf`
- **Purpose**: Core Terraform configuration
- **Contents**:
  - AWS AMI data source for Ubuntu 20.04 LTS
  - AWS provider configuration
  - EC2 instance resource definition
  - Resource tagging and monitoring

#### `variables.tf`
- **Purpose**: Define input variables
- **Variables**:
  - `ec2_name`: Instance name tag
  - `pem_key_name`: AWS key pair name
  - `aws_region`: Deployment region
  - `ec2_instance_type`: Instance type (default: t3.micro)

#### `outputs.tf`
- **Purpose**: Define output values for Port integration
- **Outputs**:
  - Instance metadata (ID, state, type)
  - Network information (IPs, DNS)
  - Security and monitoring details
  - Resource tags and relationships

#### `versions.tf`
- **Purpose**: Specify version constraints
- **Requirements**:
  - Terraform >= 1.0
  - AWS provider ~> 5.0

#### `terraform.tfvars.example`
- **Purpose**: Example configuration file
- **Usage**: Copy to `terraform.tfvars` and customize

## 🚀 GitHub Actions

### `.github/workflows/` Directory

```
.github/workflows/
├── create-an-ec2-instance.yaml    # EC2 provisioning workflow
├── create-repo-secret.yml         # Secret management workflow
└── create-test-repo.yml           # Repository creation workflow
```

#### `create-an-ec2-instance.yaml`
- **Purpose**: Provision EC2 instances via Port workflow
- **Features**:
  - Manual workflow dispatch
  - Input parameter validation
  - Port integration for tracking
  - Terraform automation
  - Entity catalog management

#### `create-repo-secret.yml`
- **Purpose**: Create GitHub repository secrets
- **Features**:
  - Secret creation via GitHub API
  - Port entity tracking
  - Security masking
  - Success/failure reporting

#### `create-test-repo.yml`
- **Purpose**: Create new GitHub repositories
- **Features**:
  - Repository creation via GitHub API
  - Port workflow integration
  - Status reporting

## 🔄 Port Integration

### Integration Points

1. **Workflow Tracking**: All workflows report status to Port
2. **Entity Management**: Automatically create/update catalog entities
3. **Audit Trail**: Complete history of infrastructure changes
4. **Status Reporting**: Success/failure notifications

### Required Secrets

```bash
# Port Configuration
PORT_CLIENT_ID=your_port_client_id
PORT_CLIENT_SECRET=your_port_client_secret

# AWS Credentials
TF_USER_AWS_KEY=your_aws_access_key
TF_USER_AWS_SECRET=your_aws_secret_key
TF_USER_AWS_REGION=your_aws_region

# GitHub Operations
PERSONAL_ACCESS_TOKEN=your_github_pat
```

## 🧪 Development Workflow

### Local Development

1. **Setup**: Install Terraform and configure AWS credentials
2. **Configuration**: Copy and customize `terraform.tfvars.example`
3. **Testing**: Use Makefile commands for validation and planning
4. **Deployment**: Apply changes locally or via GitHub Actions

### GitHub Actions Workflow

1. **Trigger**: Manual workflow dispatch or Port integration
2. **Execution**: Automated Terraform operations
3. **Integration**: Port entity creation and status updates
4. **Monitoring**: Track progress in Actions tab and Port dashboard

## 📊 Component Relationships

```
Port Dashboard
     ↓
GitHub Actions Workflows
     ↓
Terraform Configuration
     ↓
AWS Infrastructure
     ↓
Port Entity Catalog
```

## 🔍 File Dependencies

### Terraform Files
- `versions.tf` → `main.tf` → `variables.tf`
- `outputs.tf` depends on `main.tf` resources
- `terraform.tfvars` provides values for `variables.tf`

### GitHub Actions
- All workflows depend on Port secrets
- EC2 workflow depends on AWS secrets
- Repository workflows depend on GitHub PAT

### Documentation
- `README.md` references all other documentation
- `QUICKSTART.md` provides condensed setup steps
- `CONTRIBUTING.md` guides development process

## 🎯 Best Practices

### Code Organization
- Separate concerns (infrastructure, workflows, documentation)
- Use consistent naming conventions
- Maintain clear file purposes

### Security
- Never commit sensitive information
- Use environment variables and secrets
- Follow principle of least privilege

### Documentation
- Keep documentation up-to-date
- Provide examples and use cases
- Include troubleshooting information

### Testing
- Validate Terraform configuration
- Test workflows before deployment
- Monitor Port integration

## 🚀 Future Enhancements

### Potential Additions
- Additional infrastructure components (VPC, RDS, etc.)
- More GitHub Actions workflows
- Enhanced Port integration features
- Multi-cloud support
- Infrastructure testing frameworks

### Extension Points
- Modular Terraform configurations
- Reusable workflow templates
- Custom Port blueprints
- Integration with other tools
