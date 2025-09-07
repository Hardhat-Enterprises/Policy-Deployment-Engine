## 🛡️ Policy Deployment Engine: `dataproc_autoscaling_policy`

This section provides a concise policy evaluation for the `dataproc_autoscaling_policy` resource in GCP.

Reference: [Terraform Registry – dataproc_autoscaling_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_autoscaling_policy)

---

## 1. Argument Reference

### `policy_id`
- Description: (Required) The policy id. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 50 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_config`
- Description: (Optional) Describes how the autoscaler will operate for primary workers. Structure is [documented below](#nested_worker_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_worker_config`
- Description: (Optional) Describes how the autoscaler will operate for secondary workers. Structure is [documented below](#nested_secondary_worker_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_algorithm`
- Description: (Optional) Basic algorithm for autoscaling. Structure is [documented below](#nested_basic_algorithm).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The  location where the autoscaling policy should reside. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_worker_config"></a>The `worker_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_instances`
- Description: (Optional) Minimum number of instances for this group. Bounds: [2, maxInstances]. Defaults to 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instances`
- Description: (Required) Maximum number of instances for this group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Weight for the instance group, which is used to determine the fraction of total workers in the cluster from this instance group. For example, if primary workers have weight 2, and secondary workers have weight 1, the cluster will have approximately 2 primary workers for each secondary worker. The cluster may not reach the specified balance if constrained by min/max bounds or other autoscaling settings. For example, if maxInstances for secondary workers is 0, then only primary workers will be added. The cluster can also be out of balance when created. If weight is not set on any instance group, the cluster will default to equal weight for all groups: the cluster will attempt to maintain an equal number of workers in each group within the configured size bounds for each group. If weight is set for one group only, the cluster will default to zero weight on the unset group. For example if weight is set only on primary workers, the cluster will use primary workers only and no secondary workers. <a name="nested_secondary_worker_config"></a>The `secondary_worker_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_instances`
- Description: (Optional) Minimum number of instances for this group. Bounds: [0, maxInstances]. Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instances`
- Description: (Optional) Maximum number of instances for this group. Note that by default, clusters will not use secondary workers. Required for secondary workers if the minimum secondary instances is set. Bounds: [minInstances, ). Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Weight for the instance group, which is used to determine the fraction of total workers in the cluster from this instance group. For example, if primary workers have weight 2, and secondary workers have weight 1, the cluster will have approximately 2 primary workers for each secondary worker. The cluster may not reach the specified balance if constrained by min/max bounds or other autoscaling settings. For example, if maxInstances for secondary workers is 0, then only primary workers will be added. The cluster can also be out of balance when created. If weight is not set on any instance group, the cluster will default to equal weight for all groups: the cluster will attempt to maintain an equal number of workers in each group within the configured size bounds for each group. If weight is set for one group only, the cluster will default to zero weight on the unset group. For example if weight is set only on primary workers, the cluster will use primary workers only and no secondary workers. <a name="nested_basic_algorithm"></a>The `basic_algorithm` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cooldown_period`
- Description: (Optional) Duration between scaling events. A scaling period starts after the update operation from the previous event has completed. Bounds: [2m, 1d]. Default: 2m.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `yarn_config`
- Description: (Required) YARN autoscaling configuration. Structure is [documented below](#nested_basic_algorithm_yarn_config). <a name="nested_basic_algorithm_yarn_config"></a>The `yarn_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `graceful_decommission_timeout`
- Description: (Required) Timeout for YARN graceful decommissioning of Node Managers. Specifies the duration to wait for jobs to complete before forcefully removing workers (and potentially interrupting jobs). Only applicable to downscaling operations. Bounds: [0s, 1d].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_up_factor`
- Description: (Required) Fraction of average pending memory in the last cooldown period for which to add workers. A scale-up factor of 1.0 will result in scaling up so that there is no pending memory remaining after the update (more aggressive scaling). A scale-up factor closer to 0 will result in a smaller magnitude of scaling up (less aggressive scaling). Bounds: [0.0, 1.0].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_down_factor`
- Description: (Required) Fraction of average pending memory in the last cooldown period for which to remove workers. A scale-down factor of 1 will result in scaling down so that there is no available memory remaining after the update (more aggressive scaling). A scale-down factor of 0 disables removing workers, which can be beneficial for autoscaling a single job. Bounds: [0.0, 1.0].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_up_min_worker_fraction`
- Description: (Optional) Minimum scale-up threshold as a fraction of total cluster size before scaling occurs. For example, in a 20-worker cluster, a threshold of 0.1 means the autoscaler must recommend at least a 2-worker scale-up for the cluster to scale. A threshold of 0 means the autoscaler will scale up on any recommended change. Bounds: [0.0, 1.0]. Default: 0.0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_down_min_worker_fraction`
- Description: (Optional) Minimum scale-down threshold as a fraction of total cluster size before scaling occurs. For example, in a 20-worker cluster, a threshold of 0.1 means the autoscaler must recommend at least a 2 worker scale-down for the cluster to scale. A threshold of 0 means the autoscaler will scale down on any recommended change. Bounds: [0.0, 1.0]. Default: 0.0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
