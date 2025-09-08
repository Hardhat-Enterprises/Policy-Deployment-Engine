## 🛡️ Policy Deployment Engine: `bigtable_gc_policy`

This section provides a concise policy evaluation for the `bigtable_gc_policy` resource in GCP.

Reference: [Terraform Registry – bigtable_gc_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_gc_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` |  | none | None | None |
| `instance_name` |  | none | None | None |
| `column_family` |  | none | None | None |
| `project` |  | none | None | None |
| `mode` |  | none | None | None |
| `max_age` |  | none | None | None |
| `max_version` |  | none | None | None |
| `gc_rules` |  | none | None | None |
| `deletion_policy` | Setting ABANDON allows the resource to be abandoned rather than deleted. This is useful for GC policy as it cannot be deleted in a replicated instance. Possible values are: `ABANDON`. | none | None | None |
| `ignore_warnings` | Setting this to `true` allows relaxing the gc policy for replicated clusters by up to 90 days, but keep in mind this may increase how long clusters are inconsistent. Make sure you understand the risks listed at https://cloud.google.com/bigtable/docs/garbage-collection#increasing before setting this option. ----- `max_age` supports the following arguments: | none | None | None |
| `days` |  | none | None | None |
| `duration` | ----- `max_version` supports the following arguments: | none | None | None |
| `number` | ----- `gc_rules` include 2 fields: - `mode`: optional, either `intersection` or `union`. - `rules`: an array of GC policy rule, can be specified as JSON object: `{"max_age": "16h"}` or `{"max_version": 2}` - If `mode` is not specified, `rules` can only contains one GC policy. If `mode` is specified, `rules` must have at least 2 policies. | none | None | None |
