## 🛡️ Policy Deployment Engine: `bigtable_table`

This section provides a concise policy evaluation for the `bigtable_table` resource in GCP.

Reference: [Terraform Registry – bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the table. Must be 1-50 characters and must only contain hyphens, underscores, periods, letters and numbers. | true | false | Table name string in configuration; it is not a key or token and does not by itself authorize reads or writes. | None | None |
| `instance_name` | The name of the Bigtable instance. | true | false | References an instance by name; names are not secrets and do not prove caller identity. | None | None |
| `split_keys` | Warning: modifying `split_keys` on an existing table forces Terraform to replace the entire table resource. | false | false | Sharding hints for row distribution at creation time; they tune layout/operations and do not list principals allowed on the table. | None | None |
| `column_family` | Defines a column family (repeatable). Structure is documented in nested arguments. | false | false | Declares schema families for the table; schema blocks alone do not attach IAM members. | None | None |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | false | Non-secret project id for API ownership; does not embed credentials. | None | None |
| `deletion_protection` | `PROTECTED` prohibits deleting the table, column families, or the instance containing the table via the API. Defaults to `UNPROTECTED` if unset. | false | true | Without protection, accidental or malicious deletes can cause permanent data loss and sustained outage (availability impact); `PROTECTED` is a guardrail for data retention and service continuity, not only cosmetic governance. | None | None |
| `change_stream_retention` | Duration to retain change stream data. Set to 0 to disable. Typically between 1 and 7 days per provider/API limits. | false | true | Disabling (`0`) removes change history used for monitoring, recovery, and audit investigations. | 24h | 0 |
| `automated_backup_policy` | Automated backup retention and frequency. Omit or set periods/frequency to zero to disable backups. | false | true | Scheduled backups support recovery and incident response for table data. | retention_period 72h, frequency 24h | retention_period 0 |

### column_family Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `family` | The name of the column family. | true | false | Identifier for a column family in schema; not an IAM binding. | None | None |
| `type` | The type of the column family when supported by the provider. | false | false | Selects encoding/storage characteristics where applicable; unrelated to authenticating API callers. | None | None |
