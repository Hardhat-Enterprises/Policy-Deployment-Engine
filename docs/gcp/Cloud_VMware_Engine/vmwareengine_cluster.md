## 🛡️ Policy Deployment Engine: `vmwareengine_cluster`

This section provides a concise policy evaluation for the `vmwareengine_cluster` resource in GCP.

Reference: [Terraform Registry – vmwareengine_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The resource name of the private cloud to create a new cluster in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud | true | None | None |
| `name` | The ID of the Cluster. | true | None | None |

### node_type_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_type_id` |  | none | None | None |
| `node_count` | The number of nodes of this type in the cluster. | true | None | None |
| `custom_core_count` | Customized number of cores available to each node of the type. This number must always be one of `nodeType.availableCustomCoreCounts`. If zero is provided max value from `nodeType.availableCustomCoreCounts` will be used. Once the customer is created then corecount cannot be changed. | false | None | None |

### autoscaling_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscaling_policies` | The map with autoscaling policies applied to the cluster. The key is the identifier of the policy. It must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) Currently the map must contain only one element that describes the autoscaling policy for compute nodes. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies). | true | None | None |
| `min_cluster_node_count` | Minimum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | None | None |
| `max_cluster_node_count` | Maximum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | None | None |
| `cool_down_period` | The minimum duration between consecutive autoscale operations. It starts once addition or removal of nodes is fully completed. Minimum cool down period is 30m. Cool down period must be in whole minutes (for example, 30m, 31m, 50m). Mandatory for successful addition of autoscaling settings in cluster. | false | None | None |

### autoscaling_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscale_policy_id` |  | none | None | None |
| `node_type_id` | The canonical identifier of the node type to add or remove. | true | None | None |
| `scale_out_size` | Number of nodes to add to a cluster during a scale-out operation. Must be divisible by 2 for stretched clusters. | true | None | None |
| `cpu_thresholds` | Utilization thresholds pertaining to CPU utilization. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds). | false | None | None |
| `consumed_memory_thresholds` | Utilization thresholds pertaining to amount of consumed memory. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds). | false | None | None |
| `storage_thresholds` | Utilization thresholds pertaining to amount of consumed storage. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds). | false | None | None |

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
