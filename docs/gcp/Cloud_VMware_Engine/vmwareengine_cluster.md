## 🛡️ Policy Deployment Engine: `vmwareengine_cluster`

This section provides a concise policy evaluation for the `vmwareengine_cluster` resource in GCP.

Reference: [Terraform Registry – vmwareengine_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_cluster)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The resource name of the private cloud to create a new cluster in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type_configs`
- Description: (Optional) The map of cluster node types in this cluster, where the key is canonical identifier of the node type (corresponds to the NodeType). Structure is [documented below](#nested_node_type_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_settings`
- Description: (Optional) Configuration of the autoscaling applied to this cluster Structure is [documented below](#nested_autoscaling_settings). <a name="nested_node_type_configs"></a>The `node_type_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Required) The number of nodes of this type in the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_core_count`
- Description: (Optional) Customized number of cores available to each node of the type. This number must always be one of `nodeType.availableCustomCoreCounts`. If zero is provided max value from `nodeType.availableCustomCoreCounts` will be used. Once the customer is created then corecount cannot be changed. <a name="nested_autoscaling_settings"></a>The `autoscaling_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_policies`
- Description: (Required) The map with autoscaling policies applied to the cluster. The key is the identifier of the policy. It must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) Currently the map must contain only one element that describes the autoscaling policy for compute nodes. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cluster_node_count`
- Description: (Optional) Minimum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_cluster_node_count`
- Description: (Optional) Maximum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cool_down_period`
- Description: (Optional) The minimum duration between consecutive autoscale operations. It starts once addition or removal of nodes is fully completed. Minimum cool down period is 30m. Cool down period must be in whole minutes (for example, 30m, 31m, 50m). Mandatory for successful addition of autoscaling settings in cluster. <a name="nested_autoscaling_settings_autoscaling_policies"></a>The `autoscaling_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscale_policy_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type_id`
- Description: (Required) The canonical identifier of the node type to add or remove.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_out_size`
- Description: (Required) Number of nodes to add to a cluster during a scale-out operation. Must be divisible by 2 for stretched clusters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_thresholds`
- Description: (Optional) Utilization thresholds pertaining to CPU utilization. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumed_memory_thresholds`
- Description: (Optional) Utilization thresholds pertaining to amount of consumed memory. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_thresholds`
- Description: (Optional) Utilization thresholds pertaining to amount of consumed storage. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds). <a name="nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds"></a>The `cpu_thresholds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_out`
- Description: (Required) The utilization triggering the scale-out operation in percent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_in`
- Description: (Required) The utilization triggering the scale-in operation in percent. <a name="nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds"></a>The `consumed_memory_thresholds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_out`
- Description: (Required) The utilization triggering the scale-out operation in percent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_in`
- Description: (Required) The utilization triggering the scale-in operation in percent. <a name="nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds"></a>The `storage_thresholds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_out`
- Description: (Required) The utilization triggering the scale-out operation in percent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_in`
- Description: (Required) The utilization triggering the scale-in operation in percent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
