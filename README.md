# Static Website Hosting on AWS S3 using Terraform

This repository contains the necessary Terraform scripts and static files to deploy a static website on AWS S3. The website supports hosting with an index page and a custom error page.

## Repository Structure

.
├── provider.tf      # AWS provider configuration
├── var.tf           # Variables for reusable configurations
├── main.tf          # S3 bucket and object definitions
├── outputs.tf       # Terraform outputs
├── assets/          # Folder containing images and other static assets
│   ├── BG.png
│   ├── corporate.jpg
│   ├── Logo.png
│   ├── party.webp
│   ├── wedding.jpg
├── index.html       # Homepage of the website
├── error.html       # Custom error page


## Prerequisites

- [Terraform](https://www.terraform.io/downloads) installed on your local machine.
- AWS account with necessary IAM permissions to manage S3 buckets.
- AWS CLI configured with credentials and a default region.

## Steps to Deploy

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/static-website-s3-terraform.git
   cd static-website-s3-terraform
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Customize Variables**:
   Update `var.tf` to set your desired values for the bucket name and region. Example:
   ```hcl
   variable "bucket_name" {
     default = "your-unique-bucket-name"
   }

   variable "region" {
     default = "us-east-1"
   }
   ```

4. **Plan the Infrastructure**:
   ```bash
   terraform plan
   ```
   Review the changes that Terraform will apply.

5. **Apply the Configuration**:
   ```bash
   terraform apply
   ```
   Confirm when prompted.

6. **Access the Website**:
   After successful deployment, Terraform will output the website endpoint. Use the link to access your website.

## Clean Up

To destroy the resources created by Terraform:
```bash
terraform destroy
```

## Files Description

- **provider.tf**: Configures the AWS provider for Terraform.
- **var.tf**: Defines variables such as the bucket name and region.
- **main.tf**: Contains the main configuration for S3 bucket creation, website hosting setup, and file uploads.
- **outputs.tf**: Outputs the S3 website endpoint.
- **index.html**: The main landing page of the static website.
- **error.html**: A custom error page for the website.
- **background.jpg**: An image used as the background in the website.
- **Event.png**: An image of an event used in the website.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
