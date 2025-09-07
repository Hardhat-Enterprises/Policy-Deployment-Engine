## 🛡️ Policy Deployment Engine: `sql_database`

This section provides a concise policy evaluation for the `sql_database` resource in GCP.

Reference: [Terraform Registry – sql_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the database in the Cloud SQL instance. This does not include the project ID or instance name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The name of the Cloud SQL instance. This does not include the project ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `charset`
- Description: (Optional) The charset value. See MySQL's [Supported Character Sets and Collations](https://dev.mysql.com/doc/refman/5.7/en/charset-charsets.html) and Postgres' [Character Set Support](https://www.postgresql.org/docs/9.6/static/multibyte.html) for more details and supported values. Postgres databases only support a value of `UTF8` at creation time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collation`
- Description: (Optional) The collation value. See MySQL's [Supported Character Sets and Collations](https://dev.mysql.com/doc/refman/5.7/en/charset-charsets.html) and Postgres' [Collation Support](https://www.postgresql.org/docs/9.6/static/collation.html) for more details and supported values. Postgres databases only support a value of `en_US.UTF8` at creation time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: to be abandoned rather than deleted. This is useful for Postgres, where databases cannot be deleted from the API if there are users other than cloudsqlsuperuser with access. Possible values are: "ABANDON", "DELETE". Defaults to "DELETE".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
