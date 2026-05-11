## 🛡️ Policy Deployment Engine: `bigtable_gc_policy`

This section provides a concise policy evaluation for the `bigtable_gc_policy` resource in GCP.

Reference: [Terraform Registry – bigtable_gc_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_gc_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `table` | The name of the table the GC policy applies to. | true | false | Table name only identifies where GC rules apply; it does not expose credentials, grant IAM, or change who can read data by itself. | None | None |
| `instance_name` | The name of the Bigtable instance containing the table. | true | false | Instance identifier for routing the policy to the right cluster; not a secret and does not by itself widen access or weaken encryption. | None | None |
| `column_family` | The column family this GC policy is attached to. | true | false | Schema/column-family label only; it scopes which cells the GC policy affects but does not grant principals access or leak key material. | None | None |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | false | Project ID is non-secret scope metadata for API calls; it does not replace IAM checks or expose table contents. | None | None |
| `mode` | How multiple GC rules combine: `intersection` or `union`. | false | false | Controls how rule predicates are combined mathematically; it does not name principals or secrets and is not an access-control mechanism by itself. | None | None |
| `max_age` | Age-based retention block for the GC rule (evaluated as `max_age.days` or duration fields per provider). | false | false | The block is only a container in Terraform; it holds no secret values. Retention risk is expressed in nested fields such as `days`, which are evaluated separately for security impact. | None | None |
| `max_version` | Version-based retention block for the GC rule. | false | false | Structural wrapper only; it does not expose credentials. Version-count limits that affect data lifetime are in nested `number`, which is assessed separately. | None | None |
| `gc_rules` | Alternative JSON representation of GC rules when not using separate max_age/max_version blocks. | false | false | Alternate syntax for the same GC semantics; the attribute name does not carry secrets. Risk depends on the JSON content you place here, not on choosing this field instead of blocks. | None | None |
| `deletion_policy` | Behavior when deleting the GC policy resource (for example `ABANDON` for replicated instances). | false | false | Controls how Terraform abandons vs deletes the GC policy resource object; it does not grant IAM on tables or expose cell data by itself. | None | None |
| `ignore_warnings` | If true, allows relaxing GC rules for replicated clusters within documented limits; increases inconsistency risk between replicas. | false | false | Not a confidentiality or IAM control: it relaxes GC consistency warnings for replicated clusters and may affect operational consistency, but it does not publish data publicly or add principals by itself. | None | None |

### max_age Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `days` | Maximum age of cells to retain, in days. | false | true | Longer retention increases how long stale or sensitive cell history may remain recoverable (`max_age.days`). | 30 | 180 |
| `duration` | Alternative duration representation for max age when used instead of `days`. | false | false | Another encoding for the same retention length as `days`; whichever field is used, the sensitive governance question is the retention value, not the fact that this alternate attribute exists. | None | None |

### max_version Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `number` | Maximum number of versions of a cell to retain. | true | true | Higher values keep more historical versions and can extend recoverable data lifetime (`max_version.number`). | 3 | 10 |
