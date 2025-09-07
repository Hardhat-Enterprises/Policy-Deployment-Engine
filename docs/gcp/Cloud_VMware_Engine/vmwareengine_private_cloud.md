## 🛡️ Policy Deployment Engine: `vmwareengine_private_cloud`

This section provides a concise policy evaluation for the `vmwareengine_private_cloud` resource in GCP.

Reference: [Terraform Registry – vmwareengine_private_cloud](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_private_cloud)

---

## 1. Argument Reference

### `network_config`
- Description: (Required) Network configuration in the consumer project with which the peering has to be done. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management_cluster`
- Description: (Required) The management cluster for this private cloud. This used for creating and managing the default cluster. Structure is [documented below](#nested_management_cluster).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the PrivateCloud should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the PrivateCloud.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description for this private cloud.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Initial type of the private cloud. Possible values are: `STANDARD`, `TIME_LIMITED`, `STRETCHED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_delay_hours`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_deletion_delay_hours_if_zero`
- Description: <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management_cidr`
- Description: (Required) Management CIDR used by VMware management appliances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vmware_engine_network`
- Description: (Optional) The relative resource name of the VMware Engine network attached to the private cloud. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vmware_engine_network_canonical`
- Description: (Output) The canonical name of the VMware Engine network in the form: projects/{project_number}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management_ip_address_layout_version`
- Description: (Output) The IP address layout version of the management IP address range. Possible versions include: * managementIpAddressLayoutVersion=1: Indicates the legacy IP address layout used by some existing private clouds. This is no longer supported for new private clouds as it does not support all features. * managementIpAddressLayoutVersion=2: Indicates the latest IP address layout used by all newly created private clouds. This version supports all current features.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_server_ip`
- Description: (Output) DNS Server IP of the Private Cloud. <a name="nested_management_cluster"></a>The `management_cluster` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_id`
- Description: (Required) The user-provided identifier of the new Cluster. The identifier must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with RFC 1034 (https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type_configs`
- Description: (Optional) The map of cluster node types in this cluster, where the key is canonical identifier of the node type (corresponds to the NodeType). Structure is [documented below](#nested_management_cluster_node_type_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stretched_cluster_config`
- Description: (Optional) The stretched cluster configuration for the private cloud. Structure is [documented below](#nested_management_cluster_stretched_cluster_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_settings`
- Description: (Optional) Configuration of the autoscaling applied to this cluster Private cloud must have a minimum of 3 nodes to add autoscale settings Structure is [documented below](#nested_management_cluster_autoscaling_settings). <a name="nested_management_cluster_node_type_configs"></a>The `node_type_configs` block supports:
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
- Description: (Optional) Customized number of cores available to each node of the type. This number must always be one of `nodeType.availableCustomCoreCounts`. If zero is provided max value from `nodeType.availableCustomCoreCounts` will be used. This cannot be changed once the PrivateCloud is created. <a name="nested_management_cluster_stretched_cluster_config"></a>The `stretched_cluster_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_location`
- Description: (Optional) Zone that will remain operational when connection between the two zones is lost. Specify the zone in the following format: projects/{project}/locations/{location}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_location`
- Description: (Optional) Additional zone for a higher level of availability and load balancing. Specify the zone in the following format: projects/{project}/locations/{location}. <a name="nested_management_cluster_autoscaling_settings"></a>The `autoscaling_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_policies`
- Description: (Required) The map with autoscaling policies applied to the cluster. The key is the identifier of the policy. It must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) Currently the map must contain only one element that describes the autoscaling policy for compute nodes. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies).
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
- Description: (Optional) The minimum duration between consecutive autoscale operations. It starts once addition or removal of nodes is fully completed. Minimum cool down period is 30m. Cool down period must be in whole minutes (for example, 30m, 31m, 50m). Mandatory for successful addition of autoscaling settings in cluster. <a name="nested_management_cluster_autoscaling_settings_autoscaling_policies"></a>The `autoscaling_policies` block supports:
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
- Description: (Optional) Utilization thresholds pertaining to CPU utilization. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumed_memory_thresholds`
- Description: (Optional) Utilization thresholds pertaining to amount of consumed memory. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_thresholds`
- Description: (Optional) Utilization thresholds pertaining to amount of consumed storage. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds). <a name="nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds"></a>The `cpu_thresholds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_out`
- Description: (Required) The utilization triggering the scale-out operation in percent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_in`
- Description: (Required) The utilization triggering the scale-in operation in percent. <a name="nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds"></a>The `consumed_memory_thresholds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_out`
- Description: (Required) The utilization triggering the scale-out operation in percent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_in`
- Description: (Required) The utilization triggering the scale-in operation in percent. <a name="nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds"></a>The `storage_thresholds` block supports:
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
