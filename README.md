

# Terraform S3 Static Website Hosting

This project uses Terraform to provision an AWS S3 bucket for hosting a static website. It includes the upload of assets (images and other files) from a local `assets` directory and sets up the S3 bucket for static website hosting with a custom index and error page.

## Project Structure

```
.
├── provider.tf      # AWS provider configuration
├── var.tf           # Variables for reusable configurations
├── main.tf          # S3 bucket and object definitions
├── outputs.tf       # Terraform outputs
├── assets/          # Folder containing images and other static assets
│   ├── background.jpg
│   ├── Event.png
├── index.html       # Homepage of the website
├── error.html       # Custom error page
```

## Prerequisites

Before using this Terraform configuration, make sure you have the following:

- **AWS Account**: You need an AWS account and credentials configured.
- **Terraform**: Install Terraform on your local machine. You can download it from the [official website](https://www.terraform.io/downloads.html).

## Setup

1. **Clone the Repository**:
   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/terraform-s3-static-website.git
   cd terraform-s3-static-website
   ```

2. **Configure AWS Credentials**:
   Ensure your AWS credentials are configured. You can use the AWS CLI to configure them:
   ```bash
   aws configure
   ```

3. **Set Your Bucket Name**:
   Open the `var.tf` file and set a unique bucket name. The bucket name must be globally unique across all AWS accounts.

## Terraform Commands

### 1. `terraform init`
Initialize the Terraform working directory. This command downloads the necessary provider plugins and prepares the environment for the first run.

```bash
terraform init
```

### 2. `terraform validate`
Validate your Terraform configuration files. This command checks for syntax errors and potential issues in your Terraform configuration.

```bash
terraform validate
```

### 3. `terraform plan`
Create an execution plan. This command shows you what actions Terraform will take to achieve the desired state defined in your configuration files. It’s useful to review the changes before applying them.

```bash
terraform plan
```

### 4. `terraform apply`
Apply the configuration and create the resources. This command provisions the S3 bucket, uploads the `index.html`, `error.html`, and assets from the `assets/` directory, and configures the S3 bucket for static website hosting.

```bash
terraform apply
```

You will be prompted to confirm the action. Type `yes` to proceed.

### 5. `terraform destroy`
Destroy all the resources created by Terraform. This command removes the S3 bucket and all objects in it, including the website hosting configuration and assets.

```bash
terraform destroy
```

You will be prompted to confirm the destruction. Type `yes` to proceed.

## Outputs

After running `terraform apply`, the following outputs will be displayed:

- **website_endpoint**: The endpoint URL for accessing the static website hosted on S3.
- **bucket_name**: The name of the created S3 bucket.

### Example Output:
```bash
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

website_endpoint = "http://my-sample-bucket.s3-website-us-east-1.amazonaws.com"
bucket_name = "my-sample-bucket"
```

## Website Hosting

The S3 bucket is configured to serve static content. The following files are uploaded:

- **index.html**: The homepage of the website.
- **error.html**: The error page displayed when an invalid URL is accessed.
- **Assets**: Images and other static files stored in the `assets/` directory (e.g., background images, logos).

## Notes

- **Bucket Name**: Ensure that the `bucket_name` in your `var.tf` is unique. S3 bucket names must be globally unique.
- **Static Website**: The S3 bucket is configured to serve as a static website with the `index.html` as the homepage and `error.html` as the error page.
- **Assets Folder**: Place all images and static files in the `assets/` folder, and they will be uploaded to the S3 bucket under the `assets/` directory.

## Contact Me

---
Feel free to reach out if you have any questions or feedback!

- **Email**: satisholeti1020@gmail.com

- **LinkedIn**: https://www.linkedin.com/in/satisholeti/
