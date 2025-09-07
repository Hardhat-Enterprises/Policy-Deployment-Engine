## 🛡️ Policy Deployment Engine: `network_security_security_profile`

This section provides a concise policy evaluation for the `network_security_security_profile` resource in GCP.

Reference: [Terraform Registry – network_security_security_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_security_profile)

---

## 1. Argument Reference

### `type`
- Description: (Required) The type of security profile. Possible values are: `THREAT_PREVENTION`, `CUSTOM_MIRRORING`, `CUSTOM_INTERCEPT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the security profile resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of the security profile. The Max length is 512 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threat_prevention_profile`
- Description: (Optional) The threat prevention configuration for the security profile. Structure is [documented below](#nested_threat_prevention_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_mirroring_profile`
- Description: (Optional) The configuration for defining the Mirroring Endpoint Group used to mirror traffic to third-party collectors. Structure is [documented below](#nested_custom_mirroring_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_intercept_profile`
- Description: (Optional) The configuration for defining the Intercept Endpoint Group used to intercept traffic to third-party firewall appliances. Structure is [documented below](#nested_custom_intercept_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the security profile. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The name of the parent this security profile belongs to. Format: organizations/{organization_id}. <a name="nested_threat_prevention_profile"></a>The `threat_prevention_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `severity_overrides`
- Description: (Optional) The configuration for overriding threats actions by severity match. Structure is [documented below](#nested_threat_prevention_profile_severity_overrides).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threat_overrides`
- Description: (Optional) The configuration for overriding threats actions by threat id match. If a threat is matched both by configuration provided in severity overrides and threat overrides, the threat overrides action is applied. Structure is [documented below](#nested_threat_prevention_profile_threat_overrides).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `antivirus_overrides`
- Description: (Optional) Defines what action to take for antivirus threats per protocol. Structure is [documented below](#nested_threat_prevention_profile_antivirus_overrides). <a name="nested_threat_prevention_profile_severity_overrides"></a>The `severity_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) Threat action override. Possible values are: `ALERT`, `ALLOW`, `DEFAULT_ACTION`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `severity`
- Description: (Required) Severity level to match. Possible values are: `CRITICAL`, `HIGH`, `INFORMATIONAL`, `LOW`, `MEDIUM`. <a name="nested_threat_prevention_profile_threat_overrides"></a>The `threat_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) Threat action. Possible values are: `ALERT`, `ALLOW`, `DEFAULT_ACTION`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threat_id`
- Description: (Required) Vendor-specific ID of a threat to override.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Output) Type of threat. <a name="nested_threat_prevention_profile_antivirus_overrides"></a>The `antivirus_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Required) Required protocol to match. Possible values are: `SMTP`, `SMB`, `POP3`, `IMAP`, `HTTP2`, `HTTP`, `FTP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) Threat action override. For some threat types, only a subset of actions applies. Possible values are: `ALERT`, `ALLOW`, `DEFAULT_ACTION`, `DENY`. <a name="nested_custom_mirroring_profile"></a>The `custom_mirroring_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mirroring_endpoint_group`
- Description: (Required) The Mirroring Endpoint Group to which matching traffic should be mirrored. Format: projects/{project_id}/locations/global/mirroringEndpointGroups/{endpoint_group_id} <a name="nested_custom_intercept_profile"></a>The `custom_intercept_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intercept_endpoint_group`
- Description: (Required) The Intercept Endpoint Group to which matching traffic should be intercepted. Format: projects/{project_id}/locations/global/interceptEndpointGroups/{endpoint_group_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
