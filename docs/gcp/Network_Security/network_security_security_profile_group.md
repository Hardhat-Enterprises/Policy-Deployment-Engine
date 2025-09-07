## 🛡️ Policy Deployment Engine: `network_security_security_profile_group`

This section provides a concise policy evaluation for the `network_security_security_profile_group` resource in GCP.

Reference: [Terraform Registry – network_security_security_profile_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_security_profile_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the security profile group resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of the profile. The Max length is 512 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threat_prevention_profile`
- Description: (Optional) Reference to a SecurityProfile with the threat prevention configuration for the SecurityProfileGroup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_mirroring_profile`
- Description: (Optional) Reference to a SecurityProfile with the custom mirroring configuration for the SecurityProfileGroup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_intercept_profile`
- Description: (Optional) Reference to a SecurityProfile with the CustomIntercept configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the security profile group. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The name of the parent this security profile group belongs to. Format: organizations/{organization_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
