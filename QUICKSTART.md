# Quick Start Guide

This guide will help you get up and running with the Port Examples repository in under 10 minutes.

## 🚀 Prerequisites

Before you begin, ensure you have:

- [ ] AWS Account with appropriate permissions
- [ ] GitHub Account with Personal Access Token
- [ ] Port Account (sign up at [getport.io](https://getport.io/))
- [ ] Terraform installed locally (optional, for development)

## ⚡ Quick Setup

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/port-examples.git
cd port-examples
```

### 2. Configure GitHub Secrets

Go to your GitHub repository → Settings → Secrets and variables → Actions, and add:

```bash
# Port Integration
PORT_CLIENT_ID=your_port_client_id
PORT_CLIENT_SECRET=your_port_client_secret

# AWS Credentials
TF_USER_AWS_KEY=your_aws_access_key
TF_USER_AWS_SECRET=your_aws_secret_key
TF_USER_AWS_REGION=us-west-2

# GitHub Operations
PERSONAL_ACCESS_TOKEN=your_github_pat
```

### 3. Test EC2 Provisioning

1. Go to **Actions** → **Provision AN EC2 Instance**
2. Click **Run workflow**
3. Fill in the parameters:
   - **EC2 name**: `my-test-server`
   - **EC2 instance type**: `t3.micro`
   - **PEM key name**: `your-aws-key-pair-name`
   - **Port context**: Leave as default (auto-filled)
4. Click **Run workflow**

### 4. Monitor Progress

- Watch the workflow execution in the Actions tab
- Check Port dashboard for entity creation
- Verify EC2 instance in AWS Console

## 🔧 Local Development

### Install Terraform

```bash
# macOS
brew install terraform

# Or use the Makefile
make install-terraform
```

### Test Locally

```bash
cd ec2-sample-deploy

# Copy example configuration
cp terraform.tfvars.example terraform.tfvars

# Edit with your values
nano terraform.tfvars

# Initialize and test
make init
make validate
make plan
```

## 📋 Common Use Cases

### Create a New Repository

1. Go to **Actions** → **Create Test Repo**
2. Enter repository name
3. Run workflow
4. Check Port dashboard for new entity

### Manage Secrets

1. Go to **Actions** → **Create Repository Secret**
2. Enter secret key and value
3. Run workflow
4. Secret appears in GitHub repository settings

### Provision Multiple Instances

1. Use the EC2 workflow multiple times
2. Each instance gets unique tags
3. All instances tracked in Port catalog

## 🐛 Troubleshooting

### Workflow Fails

- Check GitHub Actions logs for error details
- Verify all secrets are configured correctly
- Ensure AWS credentials have proper permissions

### Terraform Errors

```bash
# Validate configuration
make validate

# Check AWS credentials
aws sts get-caller-identity

# Review plan output
make plan
```

### Port Integration Issues

- Verify `PORT_CLIENT_ID` and `PORT_CLIENT_SECRET`
- Check Port dashboard for error messages
- Ensure Port workflow is properly configured

## 📚 Next Steps

After successful setup:

1. **Explore Port Dashboard**: See your infrastructure catalog
2. **Customize Workflows**: Modify GitHub Actions for your needs
3. **Add More Resources**: Extend Terraform configuration
4. **Join Community**: Connect with other Port users

## 🆘 Need Help?

- **Documentation**: Check the main [README.md](README.md)
- **Issues**: Create a GitHub issue
- **Port Support**: [docs.getport.io](https://docs.getport.io/)
- **Community**: [community.getport.io](https://community.getport.io/)

---

**Congratulations!** You've successfully set up Port Examples and are ready to manage your infrastructure with Port's developer portal.
