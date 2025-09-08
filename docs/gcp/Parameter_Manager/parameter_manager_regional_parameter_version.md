## 🛡️ Policy Deployment Engine: `parameter_manager_regional_parameter_version`

This section provides a concise policy evaluation for the `parameter_manager_regional_parameter_version` resource in GCP.

Reference: [Terraform Registry – parameter_manager_regional_parameter_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/parameter_manager_regional_parameter_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parameter_data` | The Regional Parameter data. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `parameter` | Parameter Manager Regional Parameter resource. | true | None | None |
| `parameter_version_id` | Version ID of the Regional Parameter Version Resource. This must be unique within the Regional Parameter. | true | None | None |
| `disabled` | The current state of Regional Parameter Version. This field is only applicable for updating Regional Parameter Version. | false | None | None |
