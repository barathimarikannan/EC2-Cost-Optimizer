### Automated Cost Optimization with AWS Lambda & EventBridge

This project automates cost optimization for EC2 instances by automatically starting and stopping them at predefined times, using AWS Lambda and EventBridge.

🚀 **Project Overview**
• Infrastructure as Code: Built with Terraform.
• Automation: Two AWS Lambda functions (start_ec2, stop_ec2) triggered by scheduled EventBridge rules.
• Cost Optimization: EC2 instances are started at 8:00 AM and stopped at 8:00 PM automatically.
• CI/CD: Jenkins handles deployment pipelines via a Jenkinsfile at the root of the repository.

📁 **Project Structure**
```
.
├── Jenkinsfile
├── README.md
├── modules/
│   ├── ec2_instance/
│   ├── lambda/
│   ├── networking/
│   ├── eventbridge/
    └── security_group/
├── env/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── provider.tf

```

⚙️ **Prerequisites**

- AWS CLI
- Terraform (v1.3+ recommended)
- Jenkins with:
   - Git plugin
   - Terraform plugin
   - Pipeline plugin
- jq for local JSON parsing (optional)
