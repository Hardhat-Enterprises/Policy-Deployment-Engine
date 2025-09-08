## 🛡️ Policy Deployment Engine: `vmwareengine_network_peering`

This section provides a concise policy evaluation for the `vmwareengine_network_peering` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network_peering)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `peer_network` | The relative resource name of the network to peer with a standard VMware Engine network. The provided network can be a consumer VPC network or another standard VMware Engine network. | true | None | None |
| `peer_network_type` | The type of the network to peer with the VMware Engine network. Possible values are: `STANDARD`, `VMWARE_ENGINE_NETWORK`, `PRIVATE_SERVICES_ACCESS`, `NETAPP_CLOUD_VOLUMES`, `THIRD_PARTY_SERVICE`, `DELL_POWERSCALE`, `GOOGLE_CLOUD_NETAPP_VOLUMES`. | true | None | None |
| `vmware_engine_network` | The relative resource name of the VMware Engine network. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID. | true | None | None |
| `name` | The ID of the Network Peering. | true | None | None |
| `export_custom_routes` | True if custom routes are exported to the peered network; false otherwise. | false | None | None |
| `import_custom_routes` | True if custom routes are imported from the peered network; false otherwise. | false | None | None |
| `export_custom_routes_with_public_ip` | True if all subnet routes with a public IP address range are exported; false otherwise. | false | None | None |
| `import_custom_routes_with_public_ip` | True if custom routes are imported from the peered network; false otherwise. | false | None | None |
| `description` | User-provided description for this network peering. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
