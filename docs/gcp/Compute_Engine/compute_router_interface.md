## 🛡️ Policy Deployment Engine: `compute_router_interface`

This section provides a concise policy evaluation for the `compute_router_interface` resource in GCP.

Reference: [Terraform Registry – compute_router_interface](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_interface)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | this forces a new interface to be created. | none | None | None |
| `router` | Changing this forces a new interface to be created. In addition to the above required fields, a router interface must have specified either `ip_range` or exactly one of `vpn_tunnel`, `interconnect_attachment` or `subnetwork`, or both. - - - | none | None | None |
| `ip_range` | in the RFC3927 link-local IP space. Changing this forces a new interface to be created. | none | None | None |
| `ip_version` | IP version of this interface. Can be either IPV4 or IPV6. | none | None | None |
| `vpn_tunnel` | interface will be linked to. Changing this forces a new interface to be created. Only one of `vpn_tunnel`, `interconnect_attachment` or `subnetwork` can be specified. | none | None | None |
| `interconnect_attachment` | VLAN interconnect for this interface. Changing this forces a new interface to be created. Only one of `vpn_tunnel`, `interconnect_attachment` or `subnetwork` can be specified. | none | None | None |
| `redundant_interface` | this interface. Changing this forces a new interface to be created. | none | None | None |
| `project` | If it is not provided, the provider project is used. Changing this forces a new interface to be created. | none | None | None |
| `subnetwork` | belongs to, which must be in the same region as the Cloud Router. When you establish a BGP session to a VM instance using this interface, the VM instance must belong to the same subnetwork as the subnetwork specified here. Changing this forces a new interface to be created. Only one of `vpn_tunnel`, `interconnect_attachment` or `subnetwork` can be specified. | none | None | None |
| `private_ip_address` | to establish BGP sessions to a VM instance acting as a third-party Router Appliance. Changing this forces a new interface to be created. | none | None | None |
| `region` | If not specified, the project region will be used. Changing this forces a new interface to be created. | none | None | None |
