# 🚀 WordPress on AWS with Terraform - Complete Infrastructure as Code

[![Terraform](https://img.shields.io/badge/Terraform-v1.0+-623CE4?logo=terraform&logoColor=white)](https://terraform.io)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com)
[![WordPress](https://img.shields.io/badge/WordPress-CMS-21759B?logo=wordpress&logoColor=white)](https://wordpress.org)
[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql&logoColor=white)](https://mysql.com)

## 📋 Project Overview

This project demonstrates a **production-ready WordPress deployment** on AWS using Infrastructure as Code (IaC) with Terraform. It creates a scalable, secure, and highly available WordPress site with MySQL RDS backend.

### 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        AWS VPC (10.0.0.0/16)               │
├─────────────────────────┬───────────────────────────────────┤
│    Public Subnets       │         Private Subnets           │
│  ┌─────────────────┐    │    ┌─────────────────────────┐    │
│  │   WordPress     │    │    │      MySQL RDS          │    │
│  │   EC2 Instance  │◄───┼────┤   (Multi-AZ)           │    │
│  │   (us-east-1a)  │    │    │   (us-east-1a/1b)      │    │
│  └─────────────────┘    │    └─────────────────────────┘    │
│           │              │                                   │
│  ┌─────────────────┐    │                                   │
│  │  Internet       │    │                                   │
│  │  Gateway        │    │                                   │
│  └─────────────────┘    │                                   │
└─────────────────────────┴───────────────────────────────────┘
```

## ✨ Features

- **🔒 Secure Architecture**: Private subnets for database, public for web servers
- **🌐 Multi-AZ Deployment**: High availability across multiple availability zones
- **📦 Modular Design**: Reusable Terraform modules for networking, database, and compute
- **🔧 Environment Support**: Separate configurations for dev/test environments
- **🛡️ Security Groups**: Properly configured firewall rules
- **📊 Automated Deployment**: One-command infrastructure provisioning

## 🛠️ Prerequisites

- [Terraform](https://terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate permissions
- AWS Key Pair for EC2 access
- Basic understanding of AWS services

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd Wordpress-Mysql-Terraform_Project
```

### 2. Configure AWS Credentials
```bash
aws configure
# Enter your AWS Access Key ID, Secret Access Key, and region
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Plan Your Deployment
```bash
# For development environment
terraform plan -var-file="dev.tfvars"

# For test environment
terraform plan -var-file="test.tfvars"
```

### 5. Deploy Infrastructure
```bash
# Deploy to development
terraform apply -var-file="dev.tfvars"

# Deploy to test
terraform apply -var-file="test.tfvars"
```

### 6. Access Your WordPress Site
After deployment, get your WordPress URL:
```bash
terraform output wordpress_url
```

## 📁 Project Structure

```
├── 📂 aws_networking/          # VPC, Subnets, IGW, Route Tables
│   ├── vpc.tf
│   ├── subnets.tf
│   ├── internet_gateway.tf
│   ├── routing_table.tf
│   ├── routing_table_association.tf
│   ├── vars.tf
│   └── output.tf
├── 📂 aws_rds_database/        # MySQL RDS Configuration
│   ├── rds.tf
│   ├── rds_security_group.tf
│   ├── rds_subnet_group.tf
│   ├── vars.tf
│   └── output.tf
├── 📂 aws_wordpress/           # EC2 WordPress Setup
│   ├── wordpress_ec2.tf
│   ├── wordpress_security_group.tf
│   ├── vars.tf
│   └── output.tf
├── main.tf                     # Root module configuration
├── provider.tf                 # AWS provider setup
├── vars.tf                     # Variable definitions
├── outputs.tf                  # Output values
├── dev.tfvars                  # Development environment variables
├── test.tfvars                 # Test environment variables
└── README.md                   # This file
```

## ⚙️ Configuration

### Environment Variables

#### Development (dev.tfvars)
- **Region**: us-east-1
- **Instance**: t2.micro
- **RDS Storage**: 20GB
- **MySQL Version**: 8.0.35

#### Test (test.tfvars)
- **Region**: ap-south-1
- **Instance**: t2.micro
- **RDS Storage**: 10GB
- **MySQL Version**: 8.0.35

### Key Components

| Component | Description | Security |
|-----------|-------------|----------|
| **VPC** | Isolated network environment | 10.0.0.0/16 CIDR |
| **Public Subnets** | WordPress EC2 instances | Internet accessible |
| **Private Subnets** | MySQL RDS database | VPC-only access |
| **Security Groups** | Firewall rules | HTTP/HTTPS/SSH/MySQL |
| **RDS** | Managed MySQL database | Multi-AZ, encrypted |

## 🔧 Customization

### Modify Instance Types
Edit the `.tfvars` files to change instance sizes:
```hcl
INSTANCE_TYPE = "t3.medium"        # For more CPU/Memory
RDS_DB_INSTANCE_CLASS = "db.t3.small"  # For better DB performance
```

### Add SSL/HTTPS
The security groups already include HTTPS (port 443). Configure SSL certificates in WordPress admin.

### Scale Horizontally
Add load balancer and auto-scaling groups by extending the modules.

## 📊 Outputs

After successful deployment, you'll get:
- **WordPress URL**: Direct link to your site
- **Public IP**: EC2 instance public IP
- **VPC ID**: For reference in other projects
- **RDS Endpoint**: Database connection details

## 🛡️ Security Best Practices

✅ **Database Security**: RDS in private subnets, VPC-only access  
✅ **Network Isolation**: Separate public/private subnet architecture  
✅ **Security Groups**: Minimal required ports (22, 80, 443, 3306)  
✅ **IAM**: Use least-privilege AWS credentials  
✅ **Encryption**: RDS encryption at rest (can be enabled)  

## 🧹 Cleanup

To destroy the infrastructure:
```bash
terraform destroy -var-file="dev.tfvars"
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙋‍♂️ Support

If you found this project helpful, please ⭐ star the repository!

For questions or issues:
- Open an [Issue](../../issues)
- Connect on [LinkedIn](https://linkedin.com/in/yourprofile)

---

**Built with ❤️ using Terraform and AWS**

*This project demonstrates modern DevOps practices including Infrastructure as Code, modular architecture, and cloud-native deployment strategies.*