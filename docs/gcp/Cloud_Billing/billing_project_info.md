## 🛡️ Policy Deployment Engine: `billing_project_info`

This section provides a concise policy evaluation for the `billing_project_info` resource in GCP.

Reference: [Terraform Registry – billing_project_info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_project_info)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `billing_account` | The ID of the billing account associated with the project, if any. Set to empty string to disable billing for the project. For example, `"012345-567890-ABCDEF"` or `""`. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
