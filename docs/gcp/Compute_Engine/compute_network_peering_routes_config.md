## 🛡️ Policy Deployment Engine: `compute_network_peering_routes_config`

This section provides a concise policy evaluation for the `compute_network_peering_routes_config` resource in GCP.

Reference: [Terraform Registry – compute_network_peering_routes_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering_routes_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `peering` | Name of the peering. | true | None | None |
| `export_custom_routes` | Whether to export the custom routes to the peer network. | true | None | None |
| `import_custom_routes` | Whether to import the custom routes to the peer network. | true | None | None |
| `network` | The name of the primary network for the peering. | true | None | None |
| `export_subnet_routes_with_public_ip` | Whether subnet routes with public IP range are exported. IPv4 special-use ranges are always exported to peers and are not controlled by this field. | false | None | None |
| `import_subnet_routes_with_public_ip` | Whether subnet routes with public IP range are imported. IPv4 special-use ranges are always imported from peers and are not controlled by this field. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
