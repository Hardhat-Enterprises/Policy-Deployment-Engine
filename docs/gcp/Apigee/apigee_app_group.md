## 🛡️ Policy Deployment Engine: `apigee_app_group`

This section provides a concise policy evaluation for the `apigee_app_group` resource in GCP.

Reference: [Terraform Registry – apigee_app_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_app_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the AppGroup. Characters you can use in the name are restricted to: A-Z0-9._-$ %.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee app group, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel_uri`
- Description: (Optional) A reference to the associated storefront/marketplace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel_id`
- Description: (Optional) Channel identifier identifies the owner maintaining this grouping.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) App group name displayed in the UI
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Optional) Valid values are active or inactive. Note that the status of the AppGroup should be updated via UpdateAppGroupRequest by setting the action as active or inactive. Possible values are: `active`, `inactive`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) A list of attributes Structure is [documented below](#nested_attributes). <a name="nested_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Key of the attribute
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the attribute
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
