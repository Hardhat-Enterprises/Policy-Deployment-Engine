## 🛡️ Policy Deployment Engine: `spanner_database`

This section provides a concise policy evaluation for the `spanner_database` resource in GCP.

Reference: [Terraform Registry – spanner_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_database)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A unique identifier for the database, which cannot be changed after the instance is created. Values are of the form `[a-z][-_a-z0-9]*[a-z0-9]`. | true | false | None | None | None |
| `instance` | The instance to create the database on. | true | false | None | None | None |
| `version_retention_period` | The retention period for the database. The retention period must be between 1 hour and 7 days, and can be specified in days, hours, minutes, or seconds. For example, the values 1d, 24h, 1440m, and 86400s are equivalent. Default value is 1h. If this property is used, you must avoid adding new DDL statements to `ddl` that update the database's version_retention_period. | false | false | None | None | None |
| `ddl` | An optional list of DDL statements to run inside the database. Statements can create tables, indexes, etc. During creation these statements execute atomically with the creation of the database and if there is an error in any statement, the database is not created. Terraform does not perform drift detection on this field and assumes that the values recorded in state are accurate. Limited updates to this field are supported, and newly appended DDL statements can be executed in an update. However, modifications to prior statements will create a plan that marks the resource for recreation. | false | false | None | None | None |
| `encryption_config` | Encryption configuration for the database Structure is [documented below](#nested_encryption_config). | false | false | None | None | None |
| `database_dialect` | The dialect of the Cloud Spanner Database. If it is not provided, "GOOGLE_STANDARD_SQL" will be used. Possible values are: `GOOGLE_STANDARD_SQL`, `POSTGRESQL`. | false | false | None | None | None |
| `enable_drop_protection` | Whether drop protection is enabled for this database. Defaults to false. Drop protection is different from the "deletion_protection" attribute in the following ways: (1) "deletion_protection" only protects the database from deletions in Terraform. whereas setting “enableDropProtection” to true protects the database from deletions in all interfaces. (2) Setting "enableDropProtection" to true also prevents the deletion of the parent instance containing the database. "deletion_protection" attribute does not provide protection against the deletion of the parent instance. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the database, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the database will fail. When the field is set to false, deleting the database is allowed. | false | false | None | None | None |
| `default_time_zone` | from the tz database. Default value is "America/Los_angeles". | false | false | None | None | None |

### encryption_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | Fully qualified name of the KMS key to use to encrypt this database. This key must exist in the same location as the Spanner Database. | false | false | None | None | None |
| `kms_key_names` | Fully qualified name of the KMS keys to use to encrypt this database. The keys must exist in the same locations as the Spanner Database. | false | false | None | None | None |
