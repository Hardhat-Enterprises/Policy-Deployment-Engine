## 🛡️ Policy Deployment Engine: `compute_network_endpoints`

This section provides a concise policy evaluation for the `compute_network_endpoints` resource in GCP.

Reference: [Terraform Registry – compute_network_endpoints](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoints)

---

## 1. Argument Reference

### `network_endpoint_group`
- Description: (Required) The network endpoint group these endpoints are part of.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_endpoints`
- Description: (Optional) The network endpoints to be added to the enclosing network endpoint group (NEG). Each endpoint specifies an IP address and port, along with additional information depending on the NEG type. Structure is [documented below](#nested_network_endpoints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Zone where the containing network endpoint group is located.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network_endpoints"></a>The `network_endpoints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The name for a specific VM instance that the IP address belongs to. This is required for network endpoints of type GCE_VM_IP_PORT. The instance must be in the same zone as the network endpoint group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port number of network endpoint. **Note** `port` is required unless the Network Endpoint Group is created with the type of `GCE_VM_IP`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Required) IPv4 address of network endpoint. The IP address must belong to a VM in GCE (either the primary IP or as part of an aliased IP range).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
