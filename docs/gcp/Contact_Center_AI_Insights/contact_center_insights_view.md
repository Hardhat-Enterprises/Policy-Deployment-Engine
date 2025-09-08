## 🛡️ Policy Deployment Engine: `contact_center_insights_view`

This section provides a concise policy evaluation for the `contact_center_insights_view` resource in GCP.

Reference: [Terraform Registry – contact_center_insights_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/contact_center_insights_view)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of the resource. | true | None | None |
| `display_name` | The human-readable display name of the view. | false | None | None |
| `value` | A filter to reduce conversation results to a specific subset. Refer to https://cloud.google.com/contact-center/insights/docs/filtering for details. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
