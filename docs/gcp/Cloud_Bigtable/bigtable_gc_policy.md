## 🛡️ Policy Deployment Engine: `bigtable_gc_policy`

This section provides a concise policy evaluation for the `bigtable_gc_policy` resource in GCP.

Reference: [Terraform Registry – bigtable_gc_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_gc_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `table` | Configuration for table on this Cloud Bigtable resource. | true | false | Table whose column family GC rules apply to. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `instance_name` | Configuration for instance_name on this Cloud Bigtable resource. | true | false | Bigtable instance that contains the table. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `column_family` | Configuration for column_family on this Cloud Bigtable resource. | true | false | Column family name this GC policy attaches to. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `project` | Configuration for project on this Cloud Bigtable resource. | false | false | GCP project ID for the GC policy resource. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `mode` | Configuration for mode on this Cloud Bigtable resource. | false | false | How multiple GC rules combine (`intersection` or `union`). It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `max_age` | Configuration for max_age on this Cloud Bigtable resource. | false | false | Block for age-based retention in the GC rule. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `max_version` | Configuration for max_version on this Cloud Bigtable resource. | false | false | Block for version-based retention in the GC rule. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `gc_rules` | Configuration for gc_rules on this Cloud Bigtable resource. | false | false | Alternative JSON representation of GC rules. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `deletion_policy` | Setting ABANDON allows the resource to be abandoned rather than deleted. This is useful for GC policy as it cannot be deleted in a replicated instance. Possible values are: `ABANDON`. | false | false | Behavior when deleting the GC policy resource (e.g. `ABANDON`). It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `ignore_warnings` | Setting this to `true` allows relaxing the gc policy for replicated clusters by up to 90 days, but keep in mind this may increase how long clusters are inconsistent. Make sure you understand the risks listed at https://cloud.google.com/bigtable/docs/garbage-collection#increasing before setting this option. ----- `max_age` supports the following arguments: | false | false | Allows relaxing retention on replicated clusters; increases inconsistency risk. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `days` | Configuration for days on this Cloud Bigtable resource. | false | true | Retention longer than policy allows increases lifetime of stale/sensitive data. | 30 | 180 |
| `duration` | ----- `max_version` supports the following arguments: | false | false | Alternative max-age duration format within `max_age`. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `number` | ----- `gc_rules` include 2 fields: - `mode`: optional, either `intersection` or `union`. - `rules`: an array of GC policy rule, can be specified as JSON object: `{"max_age": "16h"}` or `{"max_version": 2}` - If `mode` is not specified, `rules` can only contains one GC policy. If `mode` is specified, `rules` must have at least 2 policies. | true | true | Keeping too many versions increases recoverable historical data beyond approved retention posture. | 3 | 10 |
