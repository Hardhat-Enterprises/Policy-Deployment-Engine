## 🛡️ Policy Deployment Engine: `network_security_gateway_security_policy_rule`

This section provides a concise policy evaluation for the `network_security_gateway_security_policy_rule` resource in GCP.

Reference: [Terraform Registry – network_security_gateway_security_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_gateway_security_policy_rule)

---

## 1. Argument Reference

### `enabled`
- Description: (Required) Whether the rule is enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Required) Priority of the rule. Lower number corresponds to higher precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_matcher`
- Description: (Required) CEL expression for matching on session criteria.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_profile`
- Description: (Required) Profile which tells what the primitive action should be. Possible values are: * ALLOW * DENY. Possible values are: `BASIC_PROFILE_UNSPECIFIED`, `ALLOW`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the resource. ame is the full resource name so projects/{project}/locations/{location}/gatewaySecurityPolicies/{gateway_security_policy}/rules/{rule} rule should match the pattern: (^a-z?$).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the gateway security policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway_security_policy`
- Description: (Required) The name of the gatewat security policy this rule belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Free-text description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_matcher`
- Description: (Optional) CEL expression for matching on L7/application level criteria.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_inspection_enabled`
- Description: (Optional) Flag to enable TLS inspection of traffic matching on. Can only be true if the parent GatewaySecurityPolicy references a TLSInspectionConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
