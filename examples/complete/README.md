# Complete Example

This example demonstrates the complete usage of the PolarDB AI Search Terraform module. It creates a full infrastructure stack including VPC, VSwitch, PolarDB cluster with AI search capabilities, and OSS bucket for data storage.

## Architecture

The example creates the following resources:

- **VPC**: Virtual Private Cloud with customizable CIDR block
- **VSwitch**: Virtual Switch in a specific availability zone
- **PolarDB Cluster**: PostgreSQL-compatible database with AI search capabilities
- **PolarDB Account**: Database account with Super privileges
- **PolarDB Database**: Application database
- **PolarDB Endpoint**: Public endpoint for database access
- **OSS Bucket**: Object storage for AI search data

## Prerequisites

1. **Alibaba Cloud Account**: You need an active Alibaba Cloud account
2. **Terraform**: Version >= 1.0
3. **Alibaba Cloud Provider**: Version >= 1.200.0
4. **Credentials**: Configure Alibaba Cloud credentials using one of the following methods:
   - Environment variables (`ALICLOUD_ACCESS_KEY` and `ALICLOUD_SECRET_KEY`)
   - Shared credentials file
   - Instance RAM role (when running on ECS)

## Usage

1. **Clone or download** this example to your local machine

2. **Navigate** to the example directory:
   ```bash
   cd examples/complete
   ```

3. **Create a terraform.tfvars file** with your specific values:
   ```hcl
   region           = "cn-hangzhou"
   name_prefix      = "my-ai-search"
   db_account_name  = "polar_ai"
   db_password      = "YourSecurePassword123!"
   db_name          = "ai_search_db"
   ```

4. **Initialize Terraform**:
   ```bash
   terraform init
   ```

5. **Plan the deployment**:
   ```bash
   terraform plan
   ```

6. **Apply the configuration**:
   ```bash
   terraform apply
   ```

7. **View outputs** after successful deployment:
   ```bash
   terraform output
   ```

## Configuration

### Required Variables

- `db_password`: Database password for the PolarDB account (must be 8-30 characters with mixed case, numbers, and special characters)

### Optional Variables

- `region`: Alibaba Cloud region (default: "cn-hangzhou")
- `name_prefix`: Prefix for resource names (default: "polardb-ai-search-example")
- `db_account_name`: Database account name (default: "polar_ai")
- `db_name`: Database name (default: "ai_search_db")

## Outputs

After deployment, the following outputs will be available:

- **Connection Information**: Database connection strings and endpoints
- **Resource IDs**: IDs of all created resources
- **Network Information**: VPC and VSwitch details
- **Storage Information**: OSS bucket details

## Important Notes

1. **Security**: The example creates a PolarDB cluster with public access for demonstration purposes. In production, consider using private endpoints and proper security groups.

2. **Costs**: This example creates billable resources. Remember to run `terraform destroy` when you're done testing.

3. **Region Availability**: Ensure that PolarDB and the specified node class are available in your chosen region.

4. **Password Requirements**: The database password must meet Alibaba Cloud's complexity requirements.

## Cleanup

To destroy all resources created by this example:

```bash
terraform destroy
```

## Support

For issues related to this module, please refer to the main module documentation or create an issue in the repository.