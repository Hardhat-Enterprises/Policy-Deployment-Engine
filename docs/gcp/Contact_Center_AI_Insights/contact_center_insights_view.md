## 🛡️ Policy Deployment Engine: `contact_center_insights_view`

This section provides a concise policy evaluation for the `contact_center_insights_view` resource in GCP.

Reference: [Terraform Registry – contact_center_insights_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/contact_center_insights_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of the resource. | true | true | This setting controls the location of the view, which could have security implications if not properly managed. | australia-southeast1 | us-central1 |
| `display_name` | The human-readable display name of the view. | false | false | Used for identification purposes only. No direct security impact. | None | None |
| `value` | A filter to reduce conversation results to a specific subset. Refer to https://cloud.google.com/contact-center/insights/docs/filtering for details. | false | false | Defines conversation filtering behaviour only. No direct security impact. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Defines the project context only. No direct security impact. | None | None |
