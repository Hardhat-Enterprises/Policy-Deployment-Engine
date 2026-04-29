## 🛡️ Policy Deployment Engine: `bigtable_table`

This section provides a concise policy evaluation for the `bigtable_table` resource in GCP.

Reference: [Terraform Registry – bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the table. Must be 1-50 characters and must only contain hyphens, underscores, periods, letters and numbers. | true | false | Terraform table name within the instance. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `instance_name` | The name of the Bigtable instance. | true | false | Which Bigtable instance hosts this table. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `split_keys` | !> **Warning:** Modifying the `split_keys` of an existing table will cause Terraform to delete/recreate the entire `google_bigtable_table` resource. | false | false | Initial row-key splits for table creation; affects layout and recreate risk, not IAM. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `column_family` | A group of columns within a table which share a common configuration. This can be specified multiple times. Structure is documented below. | false | false | Declares column families on the table schema. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | false | GCP project ID where the table resource is managed. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `deletion_protection` | When set to PROTECTED, deleting the table, column families in the table, and the instance containing the table would be prohibited (API backend deletion protection). If not provided, defaults to UNPROTECTED. | false | false | Backend deletion protection can reduce accidental removal of the table and related resources; it does not directly grant access or expose secrets by itself. | None | None |
| `change_stream_retention` | Duration to retain change stream data for the table. Set to 0 to disable. Must be between 1 and 7 days. | false | true | Setting this to "0" disables change history visibility used for monitoring and audit investigations. | "24h" | "0" |
| `automated_backup_policy` | Defines an automated backup policy for a table (retention period and frequency). Omit or set both values to "0" to disable backups. | false | true | Automated backups support recoverability and incident response for table data. | { retention_period = "72h", frequency = "24h" } | missing block, or retention_period = "0", or frequency = "0" |
| `family` | The name of the column family. | false | false | Nested column family configuration under `column_family`. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `type` | The type of the column family. | false | false | Column family type when supported by the provider. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
