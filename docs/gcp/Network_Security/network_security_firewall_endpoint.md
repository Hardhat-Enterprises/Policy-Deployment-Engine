## 🛡️ Policy Deployment Engine: `network_security_firewall_endpoint`

This section provides a concise policy evaluation for the `network_security_firewall_endpoint` resource in GCP.

Reference: [Terraform Registry – network_security_firewall_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_firewall_endpoint)

---

## 1. Argument Reference

### `billing_project_id`
- Description: (Required) Project to bill on endpoint uptime usage.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the firewall endpoint resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location (zone) of the firewall endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The name of the parent this firewall endpoint belongs to. Format: organizations/{organization_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
