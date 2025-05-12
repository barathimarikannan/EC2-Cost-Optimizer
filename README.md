AWS EC2 Cost Optimization with Terraform and Jenkins CI/CD
This project automates cost optimization for EC2 instances by automatically starting and stopping them at predefined times using AWS Lambda and EventBridge. All infrastructure is declaratively managed with Terraform, and deployments are integrated into a CI/CD pipeline using Jenkins.

🚀 Project Overview
Infrastructure as Code: Built with Terraform 

Automation: Two AWS Lambda functions (start_ec2, stop_ec2) triggered by scheduled EventBridge rules

Cost Optimization: EC2 instances are started at 8:00 AM and stopped at 8:00 PM automatically

CI/CD: Jenkins handles deployment pipelines via a Jenkinsfile at repo root

📁 Project Structure
css
Copy
Edit
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

![EC2-cost-optimizer drawio](https://github.com/user-attachments/assets/78f4ac82-a857-46ea-bf18-1c990d63ccbc)

        

⚙️ Prerequisites
AWS CLI

Terraform (v1.3+ recommended)

Jenkins with:

Git plugin

Terraform plugin

Pipeline plugin

jq for local JSON parsing (optional)

🔐 AWS Setup
1. Configure AWS Credentials
Before using Terraform, ensure AWS credentials are configured locally:

bash
Copy
Edit
aws configure
Enter your:

Access Key ID

Secret Access Key

Default region (e.g., us-east-1)

Output format (e.g., json)

🧱 Terraform Setup (Dev Environment)
2. Navigate to the Development Environment
bash
Copy
Edit
cd environments/dev
3. Initialize Terraform
bash
Copy
Edit
terraform init
4. Review the Execution Plan
bash
Copy
Edit
terraform plan -var-file="terraform.tfvars"
5. Apply the Configuration
bash
Copy
Edit
terraform apply -var-file="terraform.tfvars"
This will:

Create VPC, Subnets, Security Group

Launch EC2 instance with NGINX preinstalled

Create IAM roles and policies

Deploy Lambda functions (initial empty placeholders unless zipped)

Configure EventBridge schedules

🧩 Lambda Function Setup
6. Zip Lambda Code
From the lambda/ directory:

bash
Copy
Edit
zip start_ec2.zip start_ec2.py
zip stop_ec2.zip stop_ec2.py
Upload the zipped files to their corresponding Lambda functions manually or via Terraform (if integrated).

(Optional) Automate Zipping
bash
Copy
Edit
bash zip_scripts.sh
🔁 Jenkins CI/CD Integration
7. Jenkins Setup
Install Jenkins locally (via Docker or native)

Ensure the following plugins are installed:

Git Plugin

Pipeline Plugin

Terraform Plugin

8. Configure Pipeline
Create a new pipeline job in Jenkins

Link it to your GitHub repo

Jenkinsfile (in repo root) defines steps:

Terraform init → plan → apply

Optional: zip & upload Lambda code

🧹 Teardown (Clean-Up Resources)
From the same environment directory:

bash
Copy
Edit
terraform destroy -var-file="terraform.tfvars"
This will remove all infrastructure provisioned by Terraform.
