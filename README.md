# 🚀 Terraform Azure Application Gateway

Deploy an Azure Application Gateway using Terraform with a variable-based approach for scalable and reusable Infrastructure as Code (IaC).

Azure Application Gateway is a Layer 7 load balancer that provides intelligent traffic routing, SSL termination,
URL-based routing, and web application firewall capabilities.

---

## 📖 Project Overview

This Terraform project provisions the following Azure resources automatically:

✅ Resource Group
✅ Virtual Network (VNet)
✅ Dedicated Application Gateway Subnet
✅ Public IP Address
✅ Azure Application Gateway

---

## 🏗 Architecture

```text
                    Internet
                        │
                        │
                ┌───────────────┐
                │   Public IP   │
                └───────┬───────┘
                        │
                        │
                ┌───────▼────────┐
                │ Application     │
                │ Gateway         │
                └───────┬────────┘
                        │
                ┌───────▼────────┐
                │ Backend Pool    │
                │ (VMs/Web Apps)  │
                └─────────────────┘
```

---

## 📂 Project Structure

```text
terraform-azure-application-gateway/
│
├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── .gitignore
└── README.md
```

---

## 🛠 Prerequisites

Before deploying the infrastructure ensure you have:

| Requirement        | Description                   |
| ------------------ | ----------------------------- |
| Terraform          | Infrastructure as Code tool   |
| Azure CLI          | Azure command-line utility    |
| Azure Subscription | Active Azure account          |
| VS Code (Optional) | Better development experience |

---

## 🔐 Login to Azure

Authenticate with Azure:

```bash
az login
```

Verify the active subscription:

```bash
az account show
```

---

## ⚙️ Initialize Terraform

Initialize Terraform and download providers:

```bash
terraform init
```

Expected output:

```bash
Terraform has been successfully initialized!
```

---

## 🔍 Validate Configuration

Check Terraform configuration syntax:

```bash
terraform validate
```

---

## 📋 Review Execution Plan

Preview resources before deployment:

```bash
terraform plan
```

Terraform will show all resources that will be created.

---

## 🚀 Deploy Infrastructure

Create Azure resources:

```bash
terraform apply
```

Type:

```bash
yes
```

Resources that will be deployed:

* Resource Group
* Virtual Network
* Application Gateway Subnet
* Public IP
* Azure Application Gateway

---

## 📤 Outputs

After successful deployment:

```bash
application_gateway_name = demo-appgateway
public_ip_address = xx.xx.xx.xx
```

## 📘 Terraform Concepts Used

| Concept         | Purpose                        |
| --------------- | ------------------------------ |
| Variables       | Dynamic configuration          |
| Outputs         | Display resource values        |
| Resource Blocks | Azure resource provisioning    |
| Dependencies    | Resource relationship handling |
| Azure Provider  | Connect Terraform with Azure   |

---

## 🔥 Why Azure Application Gateway?

Azure Application Gateway offers intelligent traffic management features.

### Key Benefits:

🔹 Layer 7 Load Balancing
🔹 URL-based Routing
🔹 SSL Termination
🔹 Session Affinity
🔹 Autoscaling Support
🔹 Web Application Firewall (WAF) Support
🔹 Improved application availability

---

## 💡 Best Practices

✔ Use a dedicated subnet for Application Gateway

✔ Store Terraform state remotely

✔ Use naming conventions consistently

✔ Separate Dev, Test, and Production environments

✔ Avoid hardcoding sensitive values

---

## 👨‍💻 Author

**Ranjeet Kumar**

DevOps Enthusiast | Azure | Terraform | Kubernetes | CI/CD

⭐ If you found this project useful, consider giving it a star.

