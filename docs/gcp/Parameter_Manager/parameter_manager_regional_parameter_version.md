## 🛡️ Policy Deployment Engine: `parameter_manager_regional_parameter_version`

This section provides a concise policy evaluation for the `parameter_manager_regional_parameter_version` resource in GCP.

Reference: [Terraform Registry – parameter_manager_regional_parameter_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/parameter_manager_regional_parameter_version)

---

## 1. Argument Reference

### `parameter_data`
- Description: (Required) The Regional Parameter data. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter`
- Description: (Required) Parameter Manager Regional Parameter resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter_version_id`
- Description: (Required) Version ID of the Regional Parameter Version Resource. This must be unique within the Regional Parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) The current state of Regional Parameter Version. This field is only applicable for updating Regional Parameter Version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
