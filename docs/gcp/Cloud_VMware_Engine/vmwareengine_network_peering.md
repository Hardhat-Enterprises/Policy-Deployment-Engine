## 🛡️ Policy Deployment Engine: `vmwareengine_network_peering`

This section provides a concise policy evaluation for the `vmwareengine_network_peering` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network_peering)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `peer_network` | The relative resource name of the network to peer with a standard VMware Engine network. The provided network can be a consumer VPC network or another standard VMware Engine network. | true | true | The peer network determines which network is connected to the VMware Engine network. Only approved peer networks should be used to avoid connecting to untrusted or unmanaged networks. | projects/599444694846/locations/global/vmwareEngineNetworks/peer-c | projects/599444694846/locations/global/vmwareEngineNetworks/peer-nc |
| `peer_network_type` | The type of the network to peer with the VMware Engine network. Possible values are: `STANDARD`, `VMWARE_ENGINE_NETWORK`, `PRIVATE_SERVICES_ACCESS`, `NETAPP_CLOUD_VOLUMES`, `THIRD_PARTY_SERVICE`, `DELL_POWERSCALE`, `GOOGLE_CLOUD_NETAPP_VOLUMES`. | true | true | The peer network type controls the kind of network connection being created. Third-party service peering should be restricted because it may connect the VMware Engine network to an external or less trusted service boundary. | VMWARE_ENGINE_NETWORK | THIRD_PARTY_SERVICE |
| `vmware_engine_network` | The relative resource name of the VMware Engine network. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID. | true | true | The VMware Engine network value identifies the network where peering is configured. Using an approved network ensures peering is applied only within a trusted VMware Engine environment. | projects/599444694846/locations/global/vmwareEngineNetworks/c | projects/599444694846/locations/global/vmwareEngineNetworks/nc |
| `name` | The ID of the Network Peering. | true | true | Network peering names should follow an approved naming standard so that peering connections can be clearly identified, audited, and managed consistently. | c | nc |
| `export_custom_routes` | True if custom routes are exported to the peered network; false otherwise. | false | true | Exporting custom routes can share internal routing information with a peered network. This should be controlled to prevent unnecessary route exposure. | False | True |
| `import_custom_routes` | True if custom routes are imported from the peered network; false otherwise. | false | true | Importing custom routes can affect routing behaviour inside the VMware Engine network. This should be controlled to avoid unintended traffic paths. | False | True |
| `export_custom_routes_with_public_ip` | True if all subnet routes with a public IP address range are exported; false otherwise. | false | true | Exporting routes with public IP ranges can expose public route information to a peered network. This should normally be disabled unless explicitly approved. | False | True |
| `import_custom_routes_with_public_ip` | True if custom routes are imported from the peered network; false otherwise. | false | false | None | None | None |
| `description` | User-provided description for this network peering. | false | false | The description is used for documentation and does not directly change the security behaviour of the network peering. | None | None |
| `project` | If it is not provided, the provider project is used. | false | true | The project determines where the network peering resource is created. Using an approved project helps keep peering resources within the correct governance and billing boundary. | project-d7f19645-ccba-48ef-bce | unapproved-project |
