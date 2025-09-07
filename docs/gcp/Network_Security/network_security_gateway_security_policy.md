## 🛡️ Policy Deployment Engine: `network_security_gateway_security_policy`

This section provides a concise policy evaluation for the `network_security_gateway_security_policy` resource in GCP.

Reference: [Terraform Registry – network_security_gateway_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_gateway_security_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Name is of the form projects/{project}/locations/{location}/gatewaySecurityPolicies/{gatewaySecurityPolicy} gatewaySecurityPolicy should match the pattern:(^a-z?$).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_inspection_policy`
- Description: (Optional) Name of a TlsInspectionPolicy resource that defines how TLS inspection is performed for any rule that enables it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the gateway security policy. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
