# AWS Web Application Infrastructure with Terraform

## Project Overview
This project demonstrates the deployment of a robust, scalable, and secure web application infrastructure on AWS using Terraform. It showcases Infrastructure as Code (IaC) principles by leveraging multiple AWS services to create a production-ready web hosting environment.

## Features
- 🛠️ **Infrastructure as Code**: Fully managed and repeatable infrastructure setup using Terraform.
- 🌐 **High Availability**: Deployment of multiple EC2 instances across different subnets.
- 🔒 **Security**:
  - ✅ HTTPS with ACM certificate.
  - 🔐 Secure security group configurations with least privilege.
- 📈 **Scalability**: Easily extendable to accommodate additional resources.
- 💰 **Efficiency**: Designed for cost-effectiveness.

## Technologies Used
- ☁️ **Cloud Provider**: AWS
- 📜 **IaC Tool**: Terraform
- 🌐 **Web Server**: Apache
- 🐧 **Operating System**: Ubuntu

### Networking
- 🖧 **Application Load Balancer (ALB)**
- 🌐 **Default VPC**

### Security
- 🛡️ **ACM Certificate** for HTTPS.
- 🔒 **Security Groups** for controlled access.

## Prerequisites
- 🖥️ Active AWS Account.
- 📦 Terraform (latest version).
- 🌐 AWS CLI configured.
- 🔑 SSH Key Pair registered in AWS.

## Installation

1. 📥 Clone the repository:
   ```bash
   git clone https://github.com/yourusername/terraform-aws-web-infra.git
   cd terraform-aws-web-infra
   ```

2. ⚙️ Initialize Terraform:
   ```bash
   terraform init
   ```

3. ✏️ Review and customize variables in `terraform.tfvars`.

4. 🚀 Apply the configuration:
   ```bash
   terraform apply
   ```

## Project Structure
```
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── vpc/
    ├── security-groups/
    ├── ec2/
    └── alb/
```

## Security Considerations
- 🌐 Utilizes the default VPC for simplified networking.
- 🔒 Implements security groups configured with the principle of least privilege.
- ✅ Ensures secure communication with HTTPS using an ACM certificate.
- 🔑 Avoids hardcoding sensitive information by using variables and environment files.

## Potential Improvements
- 📊 Implement auto-scaling for enhanced scalability.
- 🕵️ Add CloudWatch monitoring for improved observability.
- 🖧 Replace the default VPC with a custom VPC for better control and isolation.
- 🗄️ Integrate a database layer.
- 🔄 Set up a CI/CD pipeline for automated deployments.

## Contributing
1. 🍴 Fork the repository.
2. 🌱 Create your feature branch:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. ✍️ Commit your changes:
   ```bash
   git commit -m 'Add YourFeature'
   ```
4. 🚀 Push to the branch:
   ```bash
   git push origin feature/YourFeature
   ```
5. 📬 Open a pull request.

## License
This project is licensed under the [MIT License](LICENSE).

## Support
If you find this project helpful, please consider 🌟 starring the repository!


> **Note**: Always consider the cost implications of running resources on AWS. Use `terraform destroy` to clean up resources when not in use.
