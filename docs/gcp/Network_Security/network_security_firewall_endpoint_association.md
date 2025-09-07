## 🛡️ Policy Deployment Engine: `network_security_firewall_endpoint_association`

This section provides a concise policy evaluation for the `network_security_firewall_endpoint_association` resource in GCP.

Reference: [Terraform Registry – network_security_firewall_endpoint_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_firewall_endpoint_association)

---

## 1. Argument Reference

### `firewall_endpoint`
- Description: (Required) The URL of the firewall endpoint that is being associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The URL of the network that is being associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the firewall endpoint association resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location (zone) of the firewall endpoint association.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_inspection_policy`
- Description: (Optional) The URL of the TlsInspectionPolicy that is being associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the association is disabled. True indicates that traffic will not be intercepted. ~> **Note:** The API will reject the request if this value is set to true when creating the resource, otherwise on an update the association can be disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The name of the parent this firewall endpoint association belongs to. Format: projects/{project_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
