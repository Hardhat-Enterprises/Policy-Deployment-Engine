## 🛡️ Policy Deployment Engine: `network_security_address_group`

This section provides a concise policy evaluation for the `network_security_address_group` resource in GCP.

Reference: [Terraform Registry – network_security_address_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_address_group)

---

## 1. Argument Reference

### `type`
- Description: (Required) The type of the Address Group. Possible values are "IPV4" or "IPV6". Possible values are: `IPV4`, `IPV6`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity`
- Description: (Required) Capacity of the Address Group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the AddressGroup resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the gateway security policy. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Free-text description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the AddressGroup resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `items`
- Description: (Optional) List of items.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `purpose`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) List of supported purposes of the Address Group. Each value may be one of: `DEFAULT`, `CLOUD_ARMOR`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The name of the parent this address group belongs to. Format: organizations/{organization_id} or projects/{project_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
