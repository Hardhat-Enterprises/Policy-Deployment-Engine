## 🛡️ Policy Deployment Engine: `bigtable_materialized_view`

This section provides a concise policy evaluation for the `bigtable_materialized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_materialized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_materialized_view)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query` | The materialized view's select query. | true | None | None |
| `materialized_view_id` | The unique name of the materialized view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | true | None | None |
| `deletion_protection` | Set to true to make the MaterializedView protected against deletion. | false | None | None |
| `instance` | The name of the instance to create the materialized view within. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
