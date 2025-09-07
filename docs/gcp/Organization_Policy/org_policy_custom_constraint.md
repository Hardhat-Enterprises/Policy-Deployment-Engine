## 🛡️ Policy Deployment Engine: `org_policy_custom_constraint`

This section provides a concise policy evaluation for the `org_policy_custom_constraint` resource in GCP.

Reference: [Terraform Registry – org_policy_custom_constraint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/org_policy_custom_constraint)

---

## 1. Argument Reference

### `name`
- Description: (Required) Immutable. The name of the custom constraint. This is unique within the organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Required) A CEL condition that refers to a supported service resource, for example `resource.management.autoUpgrade == false`. For details about CEL usage, see [Common Expression Language](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-custom-constraints#common_expression_language).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action_type`
- Description: (Required) The action to take if the condition is met. Possible values are: `ALLOW`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method_types`
- Description: (Required) A list of RESTful methods for which to enforce the constraint. Can be `CREATE`, `UPDATE`, or both. Not all Google Cloud services support both methods. To see supported methods for each service, find the service in [Supported services](https://cloud.google.com/resource-manager/docs/organization-policy/custom-constraint-supported-services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_types`
- Description: (Required) Immutable. The fully qualified name of the Google Cloud REST resource containing the object and field you want to restrict. For example, `container.googleapis.com/NodePool`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of the resource, an organization. Format should be `organizations/{organization_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A human-friendly name for the constraint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-friendly description of the constraint to display as an error message when the policy is violated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
