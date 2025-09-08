## 🛡️ Policy Deployment Engine: `compute_network_endpoint`

This section provides a concise policy evaluation for the `compute_network_endpoint` resource in GCP.

Reference: [Terraform Registry – compute_network_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_address` | IPv4 address of network endpoint. The IP address must belong to a VM in GCE (either the primary IP or as part of an aliased IP range). | true | None | None |
| `network_endpoint_group` | The network endpoint group this endpoint is part of. | true | None | None |
| `instance` | The name for a specific VM instance that the IP address belongs to. This is required for network endpoints of type GCE_VM_IP_PORT. The instance must be in the same zone of network endpoint group. | false | None | None |
| `port` | Port number of network endpoint. **Note** `port` is required unless the Network Endpoint Group is created with the type of `GCE_VM_IP` | false | None | None |
| `zone` | Zone where the containing network endpoint group is located. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
