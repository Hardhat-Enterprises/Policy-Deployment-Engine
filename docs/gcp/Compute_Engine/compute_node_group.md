## 🛡️ Policy Deployment Engine: `compute_node_group`

This section provides a concise policy evaluation for the `compute_node_group` resource in GCP.

Reference: [Terraform Registry – compute_node_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_node_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_template`
- Description: (Required) The URL of the node template to which this node group belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional textual description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_size`
- Description: (Optional) The initial number of nodes in the node group. One of `initial_size` or `autoscaling_policy` must be configured on resource creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: (Optional) Specifies how to handle instances when a node in the group undergoes maintenance. Set to one of: DEFAULT, RESTART_IN_PLACE, or MIGRATE_WITHIN_NODE_GROUP. The default value is DEFAULT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_window`
- Description: (Optional) contains properties for the timeframe of maintenance Structure is [documented below](#nested_maintenance_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_policy`
- Description: (Optional) If you use sole-tenant nodes for your workloads, you can use the node group autoscaler to automatically manage the sizes of your node groups. One of `initial_size` or `autoscaling_policy` must be configured on resource creation. Structure is [documented below](#nested_autoscaling_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_settings`
- Description: (Optional) Share settings for the node group. Structure is [documented below](#nested_share_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_interval`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the frequency of planned maintenance events. Set to one of the following: - AS_NEEDED: Hosts are eligible to receive infrastructure and hypervisor updates as they become available. - RECURRENT: Hosts receive planned infrastructure and hypervisor updates on a periodic basis, but not more frequently than every 28 days. This minimizes the number of planned maintenance operations on individual hosts and reduces the frequency of disruptions, both live migrations and terminations, on individual VMs. Possible values are: `AS_NEEDED`, `RECURRENT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Zone where this node group is located
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_maintenance_window"></a>The `maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) instances.start time of the window. This must be in UTC format that resolves to one of 00:00, 04:00, 08:00, 12:00, 16:00, or 20:00. For example, both 13:00-5 and 08:00 are valid. <a name="nested_autoscaling_policy"></a>The `autoscaling_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Required) The autoscaling mode. Set to one of the following: - OFF: Disables the autoscaler. - ON: Enables scaling in and scaling out. - ONLY_SCALE_OUT: Enables only scaling out. You must use this mode if your node groups are configured to restart their hosted VMs on minimal servers. Possible values are: `OFF`, `ON`, `ONLY_SCALE_OUT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_nodes`
- Description: (Optional) Minimum size of the node group. Must be less than or equal to max-nodes. The default value is 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_nodes`
- Description: (Required) Maximum size of the node group. Set to a value less than or equal to 100 and greater than or equal to min-nodes. <a name="nested_share_settings"></a>The `share_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_type`
- Description: (Required) Node group sharing type. Possible values are: `ORGANIZATION`, `SPECIFIC_PROJECTS`, `LOCAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_map`
- Description: (Optional) A map of project id and project config. This is only valid when shareType's value is SPECIFIC_PROJECTS. Structure is [documented below](#nested_share_settings_project_map). <a name="nested_share_settings_project_map"></a>The `project_map` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The project id/number should be the same as the key of this project config in the project map.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
