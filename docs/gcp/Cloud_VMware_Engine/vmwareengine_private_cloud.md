## 🛡️ Policy Deployment Engine: `vmwareengine_private_cloud`

This section provides a concise policy evaluation for the `vmwareengine_private_cloud` resource in GCP.

Reference: [Terraform Registry – vmwareengine_private_cloud](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_private_cloud)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location where the PrivateCloud should reside. | true | None | None |
| `name` | The ID of the PrivateCloud. | true | None | None |
| `description` | User-provided description for this private cloud. | false | None | None |
| `type` | Initial type of the private cloud. Possible values are: `STANDARD`, `TIME_LIMITED`, `STRETCHED`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_delay_hours` |  | none | None | None |
| `send_deletion_delay_hours_if_zero` |  | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `management_cidr` | Management CIDR used by VMware management appliances. | true | None | None |
| `vmware_engine_network` | The relative resource name of the VMware Engine network attached to the private cloud. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID. | false | None | None |
| `vmware_engine_network_canonical` | (Output) The canonical name of the VMware Engine network in the form: projects/{project_number}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} | none | None | None |
| `management_ip_address_layout_version` | (Output) The IP address layout version of the management IP address range. Possible versions include: * managementIpAddressLayoutVersion=1: Indicates the legacy IP address layout used by some existing private clouds. This is no longer supported for new private clouds as it does not support all features. * managementIpAddressLayoutVersion=2: Indicates the latest IP address layout used by all newly created private clouds. This version supports all current features. | none | None | None |
| `dns_server_ip` | (Output) DNS Server IP of the Private Cloud. | none | None | None |

### management_cluster Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_id` | The user-provided identifier of the new Cluster. The identifier must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with RFC 1034 (https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) | true | None | None |
| `node_type_configs` | The map of cluster node types in this cluster, where the key is canonical identifier of the node type (corresponds to the NodeType). Structure is [documented below](#nested_management_cluster_node_type_configs). | false | None | None |
| `stretched_cluster_config` | The stretched cluster configuration for the private cloud. Structure is [documented below](#nested_management_cluster_stretched_cluster_config). | false | None | None |
| `autoscaling_settings` | Configuration of the autoscaling applied to this cluster Private cloud must have a minimum of 3 nodes to add autoscale settings Structure is [documented below](#nested_management_cluster_autoscaling_settings). | false | None | None |

### node_type_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_type_id` |  | none | None | None |
| `node_count` | The number of nodes of this type in the cluster. | true | None | None |
| `custom_core_count` | Customized number of cores available to each node of the type. This number must always be one of `nodeType.availableCustomCoreCounts`. If zero is provided max value from `nodeType.availableCustomCoreCounts` will be used. This cannot be changed once the PrivateCloud is created. | false | None | None |

### stretched_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `preferred_location` | Zone that will remain operational when connection between the two zones is lost. Specify the zone in the following format: projects/{project}/locations/{location}. | false | None | None |
| `secondary_location` | Additional zone for a higher level of availability and load balancing. Specify the zone in the following format: projects/{project}/locations/{location}. | false | None | None |

### autoscaling_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscaling_policies` | The map with autoscaling policies applied to the cluster. The key is the identifier of the policy. It must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) Currently the map must contain only one element that describes the autoscaling policy for compute nodes. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies). | true | None | None |
| `min_cluster_node_count` | Minimum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | None | None |
| `max_cluster_node_count` | Maximum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | None | None |
| `cool_down_period` | The minimum duration between consecutive autoscale operations. It starts once addition or removal of nodes is fully completed. Minimum cool down period is 30m. Cool down period must be in whole minutes (for example, 30m, 31m, 50m). Mandatory for successful addition of autoscaling settings in cluster. | false | None | None |

### autoscaling_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscale_policy_id` |  | none | None | None |
| `node_type_id` | The canonical identifier of the node type to add or remove. | true | None | None |
| `scale_out_size` | Number of nodes to add to a cluster during a scale-out operation. Must be divisible by 2 for stretched clusters. | true | None | None |
| `cpu_thresholds` | Utilization thresholds pertaining to CPU utilization. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds). | false | None | None |
| `consumed_memory_thresholds` | Utilization thresholds pertaining to amount of consumed memory. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds). | false | None | None |
| `storage_thresholds` | Utilization thresholds pertaining to amount of consumed storage. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds). | false | None | None |

### cpu_thresholds Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | None | None |

### consumed_memory_thresholds Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | None | None |

### storage_thresholds Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | None | None |
