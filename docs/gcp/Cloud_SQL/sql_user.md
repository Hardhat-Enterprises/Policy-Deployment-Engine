## 🛡️ Policy Deployment Engine: `sql_user`

This section provides a concise policy evaluation for the `sql_user` resource in GCP.

Reference: [Terraform Registry – sql_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user)

---

## 1. Argument Reference

### `instance`
- Description: forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: instances this is a Required field, unless type is set to either CLOUD_IAM_USER or CLOUD_IAM_SERVICE_ACCOUNT. Don't set this field for CLOUD_IAM_USER and CLOUD_IAM_SERVICE_ACCOUNT user types for any Cloud SQL instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: user during login. The default is the database's built-in user type. Flags include "BUILT_IN", "CLOUD_IAM_USER", "CLOUD_IAM_SERVICE_ACCOUNT", "CLOUD_IAM_GROUP", "CLOUD_IAM_GROUP_USER" and "CLOUD_IAM_GROUP_SERVICE_ACCOUNT" for [Postgres](https://cloud.google.com/sql/docs/postgres/admin-api/rest/v1beta4/users#sqlusertype) and [MySQL](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/users#sqlusertype).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: Setting `ABANDON` allows the resource to be abandoned rather than deleted. This is useful for Postgres, where users cannot be deleted from the API if they have been granted SQL roles. Possible values are: `ABANDON`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_wo_version`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: for BUILT_IN users in MySQL instances. Don't set this field for PostgreSQL and SQL Server instances. Can be an IP address. Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used. The optional `password_policy` block is only supported by Mysql. The `password_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_failed_attempts`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_expiration_duration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_failed_attempts_check`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_password_verification`
- Description: The read only `password_policy.status` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locked`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_expiration_time`
- Description: ## Ephemeral Attributes Reference The following write-only attributes are supported:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_wo`
- Description: instances this is a Required field, unless type is set to either CLOUD_IAM_USER or CLOUD_IAM_SERVICE_ACCOUNT. Don't set this field for CLOUD_IAM_USER and CLOUD_IAM_SERVICE_ACCOUNT user types for any Cloud SQL instance. **Note**: This property is write-only and will not be read from the API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
