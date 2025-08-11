.PHONY: help install-terraform init plan apply destroy validate clean

# Default target
help:
	@echo "Port Examples Repository - Available Commands:"
	@echo ""
	@echo "Development Commands:"
	@echo "  install-terraform  Install Terraform (macOS)"
	@echo "  init               Initialize Terraform in ec2-sample-deploy/"
	@echo "  plan               Plan Terraform changes"
	@echo "  apply              Apply Terraform changes"
	@echo "  destroy            Destroy Terraform infrastructure"
	@echo "  validate           Validate Terraform configuration"
	@echo ""
	@echo "Utility Commands:"
	@echo "  clean              Clean up temporary files"
	@echo "  help               Show this help message"

# Install Terraform on macOS
install-terraform:
	@echo "Installing Terraform..."
	brew install terraform
	@echo "Terraform installed successfully!"

# Initialize Terraform
init:
	@echo "Initializing Terraform..."
	cd ec2-sample-deploy && terraform init

# Plan Terraform changes
plan:
	@echo "Planning Terraform changes..."
	cd ec2-sample-deploy && terraform plan

# Apply Terraform changes
apply:
	@echo "Applying Terraform changes..."
	cd ec2-sample-deploy && terraform apply

# Destroy Terraform infrastructure
destroy:
	@echo "Destroying Terraform infrastructure..."
	cd ec2-sample-deploy && terraform destroy

# Validate Terraform configuration
validate:
	@echo "Validating Terraform configuration..."
	cd ec2-sample-deploy && terraform validate

# Clean up temporary files
clean:
	@echo "Cleaning up temporary files..."
	find . -name "*.tfstate*" -delete
	find . -name ".terraform" -type d -exec rm -rf {} + 2>/dev/null || true
	find . -name "*.log" -delete
	@echo "Cleanup complete!"
