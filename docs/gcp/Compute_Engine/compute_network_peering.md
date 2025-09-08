## 🛡️ Policy Deployment Engine: `compute_network_peering`

This section provides a concise policy evaluation for the `compute_network_peering` resource in GCP.

Reference: [Terraform Registry – compute_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `network` |  | none | None | None |
| `peer_network` | may belong to a different project. | none | None | None |
| `export_custom_routes` | Whether to export the custom routes to the peer network. Defaults to `false`. | none | None | None |
| `import_custom_routes` | Whether to import the custom routes from the peer network. Defaults to `false`. | none | None | None |
| `export_subnet_routes_with_public_ip` | Whether subnet routes with public IP range are exported. The default value is true, all subnet routes are exported. The IPv4 special-use ranges (https://en.wikipedia.org/wiki/IPv4#Special_addresses) are always exported to peers and are not controlled by this field. | none | None | None |
| `import_subnet_routes_with_public_ip` | Whether subnet routes with public IP range are imported. The default value is false. The IPv4 special-use ranges (https://en.wikipedia.org/wiki/IPv4#Special_addresses) are always imported from peers and are not controlled by this field. | none | None | None |
| `stack_type` | Which IP version(s) of traffic and routes are allowed to be imported or exported between peer networks. The default value is IPV4_ONLY. Possible values: ["IPV4_ONLY", "IPV4_IPV6"]. | none | None | None |
| `update_strategy` | The update strategy determines the semantics for updates and deletes to the peering connection configuration. The default value is INDEPENDENT. Possible values: ["INDEPENDENT", "CONSENSUS"] | none | None | None |
