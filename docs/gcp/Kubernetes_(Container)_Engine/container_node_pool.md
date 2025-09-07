## 🛡️ Policy Deployment Engine: `container_node_pool`

This section provides a concise policy evaluation for the `container_node_pool` resource in GCP.

Reference: [Terraform Registry – container_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool)

---

## 1. Argument Reference

### `cluster`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling`
- Description: the size of the node pool to the current cluster usage. Structure is [documented below](#nested_autoscaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_node_count`
- Description: regional or multi-zonal clusters, this is the number of nodes per zone. Changing this will force recreation of the resource. WARNING: Resizing your node pool manually may change this value in your existing cluster, which will trigger destruction and recreation on the next Terraform run (to rectify the discrepancy).  If you don't need this value, don't set it.  If you do need it, you can [use a lifecycle block to ignore subsequent changes to this field](https://github.com/hashicorp/terraform-provider-google/issues/6901#issuecomment-667369691).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: auto-upgrade is configured. Structure is [documented below](#nested_management).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pods_per_node`
- Description: Note that this does not work on node pools which are "route-based" - that is, node pools belonging to clusters that do not have IP Aliasing enabled. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr) for more information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_locations`
- Description: The list of zones in which the node pool's nodes should be located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If unspecified, the cluster-level `node_locations` will be used. -> Note: `node_locations` will not revert to the cluster's default set of zones upon being unset. You must manually reconcile the list of zones with your cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: auto-generate a unique name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_prefix`
- Description: with the specified prefix. Conflicts with `name`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: [google_container_cluster](container_cluster.html#nested_node_config) for schema.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: configuration for [Adding Pod IP address ranges](https://cloud.google.com/kubernetes-engine/docs/how-to/multi-pod-cidr)) to the node pool. Or enabling private nodes. Structure is [documented below](#nested_network_config)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: update the number of nodes per instance group but should not be used alongside `autoscaling`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: the provider-configured project will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: and `auto_upgrade` are both specified, they will fight each other for what the node version should be, so setting both is highly discouraged. While a fuzzy version can be specified, it's recommended that you specify explicit versions as Terraform will see spurious diffs when fuzzy versions are used. See the `google_container_engine_versions` data source's `version_prefix` field to approximate fuzzy versions in a Terraform-compatible way.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `placement_policy`
- Description: nodes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queued_provisioning`
- Description: Structure is [documented below](#nested_queued_provisioning). <a name="nested_autoscaling"></a>The `autoscaling` block supports (either total or per zone limits are required):
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: Must be >=0 and <= `max_node_count`. Cannot be used with total limits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_node_count`
- Description: Must be >= min_node_count. Cannot be used with total limits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_min_node_count`
- Description: Must be >=0 and <= `total_max_node_count`. Cannot be used with per zone limits. Total size limits are supported only in 1.24.1+ clusters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_max_node_count`
- Description: Must be >= total_min_node_count. Cannot be used with per zone limits. Total size limits are supported only in 1.24.1+ clusters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_policy`
- Description: scaling-up the node pool. Location policy is supported only in 1.24.1+ clusters. * "BALANCED" - Is a best effort policy that aims to balance the sizes of available zones. * "ANY" - Instructs the cluster autoscaler to prioritize utilization of unused reservations, and reduce preemption risk for Spot VMs. <a name="nested_management"></a>The `management` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_repair`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_upgrade`
- Description: <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_pod_range`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_private_nodes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_ipv4_cidr_block`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_range`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_node_network_configs`
- Description: Structure is [documented below](#nested_additional_node_network_configs)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_pod_network_configs`
- Description: Structure is [documented below](#nested_additional_pod_network_configs)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_cidr_overprovision_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_performance_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: <a name="nested_additional_node_network_configs"></a>The `additional_node_network_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: <a name="nested_additional_pod_network_configs"></a>The `additional_pod_network_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_pod_range`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pods_per_node`
- Description: <a name="network_performance_config"></a>The `network_performance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_surge`
- Description: an upgrade. Increasing `max_surge` raises the number of nodes that can be upgraded simultaneously. Can be set to 0 or greater.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_unavailable`
- Description: an upgrade. Increasing `max_unavailable` raises the number of nodes that can be upgraded in parallel. Can be set to 0 or greater. `max_surge` and `max_unavailable` must not be negative and at least one of them must be greater than zero.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strategy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blue_green_settings`
- Description: Structure is [documented below](#nested_blue_green_settings) <a name="nested_blue_green_settings"></a>The `blue_green_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard_rollout_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch_percentage`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch_node_count`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch_soak_duration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd_encryption_mode`
- Description: Accepted values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_soak_duration`
- Description: After this period, the blue pool will be cleaned up. <a name="nested_placement_policy"></a>The `placement_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: Specifying COMPACT placement policy type places node pool's nodes in a closer physical proximity in order to reduce network latency between nodes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_name`
- Description: The resource policy must be in the same project and region as the node pool. If not found, InvalidArgument error is returned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tpu_topology`
- Description: <a name="nested_queued_provisioning"></a> The `queued_provisioning` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
