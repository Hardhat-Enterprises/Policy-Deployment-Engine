## 🛡️ Policy Deployment Engine: `compute_network_peering_routes_config`

This section provides a concise policy evaluation for the `compute_network_peering_routes_config` resource in GCP.

Reference: [Terraform Registry – compute_network_peering_routes_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering_routes_config)

---

## 1. Argument Reference

### `peering`
- Description: (Required) Name of the peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_custom_routes`
- Description: (Required) Whether to export the custom routes to the peer network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_custom_routes`
- Description: (Required) Whether to import the custom routes to the peer network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The name of the primary network for the peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_subnet_routes_with_public_ip`
- Description: (Optional) Whether subnet routes with public IP range are exported. IPv4 special-use ranges are always exported to peers and are not controlled by this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_subnet_routes_with_public_ip`
- Description: (Optional) Whether subnet routes with public IP range are imported. IPv4 special-use ranges are always imported from peers and are not controlled by this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
