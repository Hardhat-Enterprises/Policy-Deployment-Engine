## 🛡️ Policy Deployment Engine: `sql_user`

This section provides a concise policy evaluation for the `sql_user` resource in GCP.

Reference: [Terraform Registry – sql_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance` | forces a new resource to be created. | none | None | None |
| `name` | to be created. | none | None | None |
| `password` | instances this is a Required field, unless type is set to either CLOUD_IAM_USER or CLOUD_IAM_SERVICE_ACCOUNT. Don't set this field for CLOUD_IAM_USER and CLOUD_IAM_SERVICE_ACCOUNT user types for any Cloud SQL instance. | none | None | None |
| `type` | user during login. The default is the database's built-in user type. Flags include "BUILT_IN", "CLOUD_IAM_USER", "CLOUD_IAM_SERVICE_ACCOUNT", "CLOUD_IAM_GROUP", "CLOUD_IAM_GROUP_USER" and "CLOUD_IAM_GROUP_SERVICE_ACCOUNT" for [Postgres](https://cloud.google.com/sql/docs/postgres/admin-api/rest/v1beta4/users#sqlusertype) and [MySQL](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/users#sqlusertype). | none | None | None |
| `deletion_policy` | Setting `ABANDON` allows the resource to be abandoned rather than deleted. This is useful for Postgres, where users cannot be deleted from the API if they have been granted SQL roles. Possible values are: `ABANDON`. | none | None | None |
| `password_wo_version` | - - - | none | None | None |
| `host` | for BUILT_IN users in MySQL instances. Don't set this field for PostgreSQL and SQL Server instances. Can be an IP address. Changing this forces a new resource to be created. | none | None | None |
| `project` | is not provided, the provider project is used. The optional `password_policy` block is only supported by Mysql. The `password_policy` block supports: | none | None | None |
| `allowed_failed_attempts` |  | none | None | None |
| `password_expiration_duration` |  | none | None | None |
| `enable_failed_attempts_check` |  | none | None | None |
| `enable_password_verification` | The read only `password_policy.status` subblock supports: | none | None | None |
| `locked` |  | none | None | None |
| `password_expiration_time` | ## Ephemeral Attributes Reference The following write-only attributes are supported: | none | None | None |
| `password_wo` | instances this is a Required field, unless type is set to either CLOUD_IAM_USER or CLOUD_IAM_SERVICE_ACCOUNT. Don't set this field for CLOUD_IAM_USER and CLOUD_IAM_SERVICE_ACCOUNT user types for any Cloud SQL instance. **Note**: This property is write-only and will not be read from the API. | none | None | None |
