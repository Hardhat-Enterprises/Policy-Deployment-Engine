## 🛡️ Policy Deployment Engine: `vmwareengine_network_peering`

This section provides a concise policy evaluation for the `vmwareengine_network_peering` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network_peering)

---

## 1. Argument Reference

### `peer_network`
- Description: (Required) The relative resource name of the network to peer with a standard VMware Engine network. The provided network can be a consumer VPC network or another standard VMware Engine network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_network_type`
- Description: (Required) The type of the network to peer with the VMware Engine network. Possible values are: `STANDARD`, `VMWARE_ENGINE_NETWORK`, `PRIVATE_SERVICES_ACCESS`, `NETAPP_CLOUD_VOLUMES`, `THIRD_PARTY_SERVICE`, `DELL_POWERSCALE`, `GOOGLE_CLOUD_NETAPP_VOLUMES`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vmware_engine_network`
- Description: (Required) The relative resource name of the VMware Engine network. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the Network Peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_custom_routes`
- Description: (Optional) True if custom routes are exported to the peered network; false otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_custom_routes`
- Description: (Optional) True if custom routes are imported from the peered network; false otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_custom_routes_with_public_ip`
- Description: (Optional) True if all subnet routes with a public IP address range are exported; false otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_custom_routes_with_public_ip`
- Description: (Optional) True if custom routes are imported from the peered network; false otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description for this network peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
