## 🛡️ Policy Deployment Engine: `compute_network_peering`

This section provides a concise policy evaluation for the `compute_network_peering` resource in GCP.

Reference: [Terraform Registry – compute_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_network`
- Description: may belong to a different project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_custom_routes`
- Description: Whether to export the custom routes to the peer network. Defaults to `false`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_custom_routes`
- Description: Whether to import the custom routes from the peer network. Defaults to `false`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_subnet_routes_with_public_ip`
- Description: Whether subnet routes with public IP range are exported. The default value is true, all subnet routes are exported. The IPv4 special-use ranges (https://en.wikipedia.org/wiki/IPv4#Special_addresses) are always exported to peers and are not controlled by this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_subnet_routes_with_public_ip`
- Description: Whether subnet routes with public IP range are imported. The default value is false. The IPv4 special-use ranges (https://en.wikipedia.org/wiki/IPv4#Special_addresses) are always imported from peers and are not controlled by this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stack_type`
- Description: Which IP version(s) of traffic and routes are allowed to be imported or exported between peer networks. The default value is IPV4_ONLY. Possible values: ["IPV4_ONLY", "IPV4_IPV6"].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_strategy`
- Description: The update strategy determines the semantics for updates and deletes to the peering connection configuration. The default value is INDEPENDENT. Possible values: ["INDEPENDENT", "CONSENSUS"]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
