## 🛡️ Policy Deployment Engine: `network_security_security_profile`

This section provides a concise policy evaluation for the `network_security_security_profile` resource in GCP.

Reference: [Terraform Registry – network_security_security_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_security_profile)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The type of security profile. Possible values are: `THREAT_PREVENTION`, `CUSTOM_MIRRORING`, `CUSTOM_INTERCEPT`. | true | false | None | None | None |
| `name` | The name of the security profile resource. | true | false | None | None | None |
| `description` | An optional description of the security profile. The Max length is 512 characters. | false | false | None | None | None |
| `labels` | A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `threat_prevention_profile` | The threat prevention configuration for the security profile. Structure is [documented below](#nested_threat_prevention_profile). | false | false | None | None | None |
| `custom_mirroring_profile` | The configuration for defining the Mirroring Endpoint Group used to mirror traffic to third-party collectors. Structure is [documented below](#nested_custom_mirroring_profile). | false | false | None | None | None |
| `custom_intercept_profile` | The configuration for defining the Intercept Endpoint Group used to intercept traffic to third-party firewall appliances. Structure is [documented below](#nested_custom_intercept_profile). | false | false | None | None | None |
| `location` | The location of the security profile. The default value is `global`. | false | false | None | None | None |
| `parent` | The name of the parent this security profile belongs to. Format: organizations/{organization_id}. | false | false | None | None | None |
| `severity_overrides` |  | false | false | None | None | None |
| `threat_overrides` |  | false | false | None | None | None |
| `antivirus_overrides` |  | false | false | None | None | None |

### threat_prevention_profile Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `severity_overrides` | The configuration for overriding threats actions by severity match. Structure is [documented below](#nested_threat_prevention_profile_severity_overrides). | false | false | None | None | None |
| `threat_overrides` | The configuration for overriding threats actions by threat id match. If a threat is matched both by configuration provided in severity overrides and threat overrides, the threat overrides action is applied. Structure is [documented below](#nested_threat_prevention_profile_threat_overrides). | false | false | None | None | None |
| `antivirus_overrides` | Defines what action to take for antivirus threats per protocol. Structure is [documented below](#nested_threat_prevention_profile_antivirus_overrides). | false | false | None | None | None |

### custom_mirroring_profile Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mirroring_endpoint_group` | The Mirroring Endpoint Group to which matching traffic should be mirrored. Format: projects/{project_id}/locations/global/mirroringEndpointGroups/{endpoint_group_id} | true | false | None | None | None |

### custom_intercept_profile Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `intercept_endpoint_group` | The Intercept Endpoint Group to which matching traffic should be intercepted. Format: projects/{project_id}/locations/global/interceptEndpointGroups/{endpoint_group_id} | true | false | None | None | None |

### severity_overrides Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `action` | Threat action override. Possible values are: `ALERT`, `ALLOW`, `DEFAULT_ACTION`, `DENY`. | true | false | None | None | None |
| `severity` | Severity level to match. Possible values are: `CRITICAL`, `HIGH`, `INFORMATIONAL`, `LOW`, `MEDIUM`. | true | false | None | None | None |

### threat_overrides Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `action` | Threat action. Possible values are: `ALERT`, `ALLOW`, `DEFAULT_ACTION`, `DENY`. | true | false | None | None | None |
| `threat_id` | Vendor-specific ID of a threat to override. | true | false | None | None | None |
| `type` | (Output) Type of threat. | false | false | None | None | None |

### antivirus_overrides Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `protocol` | Required protocol to match. Possible values are: `SMTP`, `SMB`, `POP3`, `IMAP`, `HTTP2`, `HTTP`, `FTP`. | true | false | None | None | None |
| `action` | Threat action override. For some threat types, only a subset of actions applies. Possible values are: `ALERT`, `ALLOW`, `DEFAULT_ACTION`, `DENY`. | true | false | None | None | None |
