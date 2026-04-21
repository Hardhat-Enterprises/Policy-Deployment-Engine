## 🛡️ Policy Deployment Engine: `bigtable_materialized_view`

This section provides a concise policy evaluation for the `bigtable_materialized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_materialized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_materialized_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` | The materialized view's select query. | true | false | Query defining the materialized view contents. | None | None |
| `materialized_view_id` | The unique name of the materialized view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | true | false | Terraform identifier for the materialized view. | None | None |
| `deletion_protection` | Set to true to make the MaterializedView protected against deletion. | false | false | Protects against accidental deletion of the materialized view. | None | None |
| `instance` | The name of the instance to create the materialized view within. | false | false | Hosting Bigtable instance. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | GCP project ID. | None | None |
