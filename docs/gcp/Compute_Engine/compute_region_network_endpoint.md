## 🛡️ Policy Deployment Engine: `compute_region_network_endpoint`

This section provides a concise policy evaluation for the `compute_region_network_endpoint` resource in GCP.

Reference: [Terraform Registry – compute_region_network_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint)

---

## 1. Argument Reference

### `port`
- Description: (Required) Port number of network endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region_network_endpoint_group`
- Description: (Required) The network endpoint group this endpoint is part of.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) IPv4 address external endpoint. This can only be specified when network_endpoint_type of the NEG is INTERNET_IP_PORT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fqdn`
- Description: (Optional) Fully qualified domain name of network endpoint. This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_destination_port`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Client destination port for the `GCE_VM_IP_PORTMAP` NEG.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The name for a specific VM instance that the IP address belongs to. This is required for network endpoints of type GCE_VM_IP_PORTMAP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the containing network endpoint group is located.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
