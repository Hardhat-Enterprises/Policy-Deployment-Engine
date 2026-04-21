## 🛡️ Policy Deployment Engine: `bigtable_logical_view`

This section provides a concise policy evaluation for the `bigtable_logical_view` resource in GCP.

Reference: [Terraform Registry – bigtable_logical_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_logical_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` | The logical view's select query. | true | false | This argument is primarily operational and should follow platform standards. | None | None |
| `logical_view_id` | The unique name of the logical view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | true | false | This argument is primarily operational and should follow platform standards. | None | None |
| `deletion_protection` | Set to true to make the logical view protected against deletion. | false | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |
| `instance` | The name of the instance to create the logical view within. | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |
