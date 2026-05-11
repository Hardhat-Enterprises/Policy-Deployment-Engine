## 🛡️ Policy Deployment Engine: `bigtable_logical_view`

This section provides a concise policy evaluation for the `bigtable_logical_view` resource in GCP.

Reference: [Terraform Registry – bigtable_logical_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_logical_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` | The logical view's select query. | true | false | Defines how rows/columns are projected for the logical view; it is query logic in configuration, not an IAM binding and not a substitute for authentication—access is still enforced by IAM and client identity. | None | None |
| `logical_view_id` | The unique name of the logical view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | true | false | Terraform/API identifier only; like a resource name it does not carry secrets and does not by itself authorize callers. | None | None |
| `deletion_protection` | Set to true to make the logical view protected against deletion. | false | false | Guards against accidental deletion of the view definition in Terraform/API workflows; it does not publish data publicly or add IAM principals. | None | None |
| `instance` | The name of the instance to create the logical view within. | false | false | Selects the hosting instance by name; names are non-secret references and do not grant wide access without proper IAM on projects/instances. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project ID scopes API calls; it is public metadata and not equivalent to credentials or row-level access. | None | None |
