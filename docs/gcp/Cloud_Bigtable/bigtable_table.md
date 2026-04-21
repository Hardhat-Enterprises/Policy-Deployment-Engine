## 🛡️ Policy Deployment Engine: `bigtable_table`

This section provides a concise policy evaluation for the `bigtable_table` resource in GCP.

Reference: [Terraform Registry – bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Configuration for name on this Cloud Bigtable resource. | true | false | Terraform table name within the instance. | None | None |
| `instance_name` | Configuration for instance_name on this Cloud Bigtable resource. | true | false | Which Bigtable instance hosts this table. | None | None |
| `split_keys` | !> **Warning:** Modifying the `split_keys` of an existing table will cause Terraform to delete/recreate the entire `google_bigtable_table` resource. | false | false | Initial row-key splits for table creation; affects layout and recreate risk, not IAM. | None | None |
| `column_family` | Configuration for column_family on this Cloud Bigtable resource. | true | false | Declares column families on the table schema. | None | None |
| `project` | is not provided, the provider project is used. | true | false | GCP project ID where the table resource is managed. | None | None |
| `deletion_protection` | Configuration for deletion_protection on this Cloud Bigtable resource. | false | false | Terraform-side guard against accidental destroy of the table resource. | None | None |
| `change_stream_retention` | Configuration for change_stream_retention on this Cloud Bigtable resource. | false | true | Setting this to "0" disables change history visibility used for monitoring and audit investigations. | "24h" | "0" |
| `automated_backup_policy` | ----- `column_family` supports the following arguments: | false | true | Automated backups support recoverability and incident response for table data. | { retention_period = "72h", frequency = "24h" } | missing block, or retention_period = "0", or frequency = "0" |
| `family` | Configuration for family on this Cloud Bigtable resource. | true | false | Nested column family configuration under `column_family`. | None | None |
| `type` | Configuration for type on this Cloud Bigtable resource. | false | false | Table type variant when supported by the provider. | None | None |
