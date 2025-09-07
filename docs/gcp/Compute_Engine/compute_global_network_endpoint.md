## 🛡️ Policy Deployment Engine: `compute_global_network_endpoint`

This section provides a concise policy evaluation for the `compute_global_network_endpoint` resource in GCP.

Reference: [Terraform Registry – compute_global_network_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_network_endpoint)

---

## 1. Argument Reference

### `port`
- Description: (Required) Port number of the external endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `global_network_endpoint_group`
- Description: (Required) The global network endpoint group this endpoint is part of.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) IPv4 address external endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fqdn`
- Description: (Optional) Fully qualified domain name of network endpoint. This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
