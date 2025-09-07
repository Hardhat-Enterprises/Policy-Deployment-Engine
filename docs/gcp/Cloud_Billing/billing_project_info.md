## 🛡️ Policy Deployment Engine: `billing_project_info`

This section provides a concise policy evaluation for the `billing_project_info` resource in GCP.

Reference: [Terraform Registry – billing_project_info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_project_info)

---

## 1. Argument Reference

### `billing_account`
- Description: (Required) The ID of the billing account associated with the project, if any. Set to empty string to disable billing for the project. For example, `"012345-567890-ABCDEF"` or `""`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
