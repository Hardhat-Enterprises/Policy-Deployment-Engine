## 🛡️ Policy Deployment Engine: `bigtable_materialized_view`

This section provides a concise policy evaluation for the `bigtable_materialized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_materialized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_materialized_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` | The materialized view's select query. | true | false | Defines the derived dataset for the materialized view; it is configuration logic, not an IAM principal list and not the stored customer payload itself—callers still must authenticate. | None | None |
| `materialized_view_id` | The unique name of the materialized view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | true | false | Resource name only; identifiers do not expose API keys or determine who may query the view. | None | None |
| `deletion_protection` | Set to true to make the MaterializedView protected against deletion. | false | false | Protects the view resource from accidental deletion in IaC/API flows; it does not widen IAM or leak table contents by itself. | None | None |
| `instance` | The name of the instance to create the materialized view within. | false | false | Instance reference for placement only; not a credential and not an access grant. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Non-secret project identifier for API scope; security boundaries remain IAM and authentication. | None | None |
