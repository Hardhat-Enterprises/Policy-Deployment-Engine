## 🛡️ Policy Deployment Engine: `vmwareengine_network_policy`

This section provides a concise policy evaluation for the `vmwareengine_network_policy` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `edge_services_cidr` | IP address range in CIDR notation used to create internet access and external IP access. An RFC 1918 CIDR block, with a "/26" prefix, is required. The range cannot overlap with any prefixes either in the consumer VPC network or in use by the private clouds attached to that VPC network. | true | None | None |
| `vmware_engine_network` | The relative resource name of the VMware Engine network. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID. | true | None | None |
| `location` | The resource name of the location (region) to create the new network policy in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-central1 | true | None | None |
| `name` | The ID of the Network Policy. | true | None | None |
| `description` | User-provided description for this network policy. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### internet_access Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | True if the service is enabled; false otherwise. | false | None | None |
| `state` | (Output) State of the service. New values may be added to this enum when appropriate. | none | None | None |

### external_ip Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | True if the service is enabled; false otherwise. | false | None | None |
| `state` | (Output) State of the service. New values may be added to this enum when appropriate. | none | None | None |
