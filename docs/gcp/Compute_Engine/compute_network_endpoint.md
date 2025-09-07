## 🛡️ Policy Deployment Engine: `compute_network_endpoint`

This section provides a concise policy evaluation for the `compute_network_endpoint` resource in GCP.

Reference: [Terraform Registry – compute_network_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint)

---

## 1. Argument Reference

### `ip_address`
- Description: (Required) IPv4 address of network endpoint. The IP address must belong to a VM in GCE (either the primary IP or as part of an aliased IP range).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_endpoint_group`
- Description: (Required) The network endpoint group this endpoint is part of.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The name for a specific VM instance that the IP address belongs to. This is required for network endpoints of type GCE_VM_IP_PORT. The instance must be in the same zone of network endpoint group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port number of network endpoint. **Note** `port` is required unless the Network Endpoint Group is created with the type of `GCE_VM_IP`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Zone where the containing network endpoint group is located.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
