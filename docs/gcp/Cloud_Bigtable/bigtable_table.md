## 🛡️ Policy Deployment Engine: `bigtable_table`

This section provides a concise policy evaluation for the `bigtable_table` resource in GCP.

Reference: [Terraform Registry – bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `instance_name` |  | none | None | None |
| `split_keys` | !> **Warning:** Modifying the `split_keys` of an existing table will cause Terraform to delete/recreate the entire `google_bigtable_table` resource. | none | None | None |
| `column_family` |  | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `deletion_protection` |  | none | None | None |
| `change_stream_retention` |  | none | None | None |
| `automated_backup_policy` | ----- `column_family` supports the following arguments: | none | None | None |
| `family` |  | none | None | None |
| `type` |  | none | None | None |
