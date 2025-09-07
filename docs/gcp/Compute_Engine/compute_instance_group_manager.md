## 🛡️ Policy Deployment Engine: `compute_instance_group_manager`

This section provides a concise policy evaluation for the `compute_instance_group_manager` resource in GCP.

Reference: [Terraform Registry – compute_instance_group_manager](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_manager)

---

## 1. Argument Reference

### `base_instance_name`
- Description: instances in this group. The value must be a valid [RFC1035](https://www.ietf.org/rfc/rfc1035.txt) name. Supported characters are lowercase letters, numbers, and hyphens (-). Instances are named by appending a hyphen and a random four-character string to the base instance name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: version deals with a specific instance template, allowing canary release scenarios. Structure is [documented below](#nested_version).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: characters long and comply with [RFC1035](https://www.ietf.org/rfc/rfc1035.txt). Supported characters include lowercase letters, numbers, and hyphens.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: in. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: group manager.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `named_port`
- Description: for details on configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_size`
- Description: instance group. This value will fight with autoscaler settings when set, and generally shouldn't be set when using one. If a value is required, such as to specify a creation-time target size for the MIG, `lifecycle.ignore_changes` can be used to prevent Terraform from modifying the value. Defaults to `0`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `list_managed_instances_results`
- Description: method for this managed instance group. Valid values are: `PAGELESS`, `PAGINATED`. If `PAGELESS` (default), Pagination is disabled for the group's `listManagedInstances` API method. `maxResults` and `pageToken` query parameters are ignored and all instances are returned in a single response. If `PAGINATED`, pagination is enabled, `maxResults` and `pageToken` query parameters are respected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_pools`
- Description: instances in the group are added. Updating the target pools attribute does not affect existing instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait_for_instances`
- Description: returning. Note that if this is set to true and the operation does not succeed, Terraform will continue trying until it times out.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait_for_instances_status`
- Description: When `STABLE` is specified this resource will wait until the instances are stable before returning. When `UPDATED` is set, it will wait for the version target to be reached and any per instance configs to be effective as well as all instances to be stable before returning. The possible values are `STABLE` and `UPDATED` ---
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_healing_policies`
- Description: group. You can specify only one value. Structure is [documented below](#nested_auto_healing_policies). For more information, see the [official documentation](https://cloud.google.com/compute/docs/instance-groups/creating-groups-of-managed-instances#monitoring_groups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_instances_config`
- Description: Properties to set on all instances in the group. After setting allInstancesConfig on the group, you must update the group's instances to apply the configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standby_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_suspended_size`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_stopped_size`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stateful_disk`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stateful_internal_ip`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stateful_external_ip`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_policies`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `standby_policy` Block

### `initial_delay_sec`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: - - - <a name="nested_update_policy"></a>The `update_policy` block supports: ```hcl update_policy { type                           = "PROACTIVE" minimal_action                 = "REPLACE" most_disruptive_allowed_action = "REPLACE" max_surge_fixed                = 0 max_unavailable_fixed          = 2 min_ready_sec                  = 50 replacement_method             = "RECREATE" } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimal_action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `most_disruptive_allowed_action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_surge_fixed`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_surge_percent`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_unavailable_fixed`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_unavailable_percent`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_ready_sec`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replacement_method`
- Description: - - - <a name="nested_instance_lifecycle_policy"></a>The `instance_lifecycle_policy` block supports: ```hcl instance_lifecycle_policy { force_update_on_repair    = "YES" default_action_on_failure = "DO_NOTHING" on_failed_health_check    = "DO_NOTHING"   //google-beta only } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_update_on_repair`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_action_on_failure`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_failed_health_check`
- Description: - - - <a name="nested_all_instances_config"></a>The `all_instances_config` block supports: ```hcl all_instances_config { metadata = { metadata_key = "metadata_value" } labels = { label_key = "label_Value" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: - - - <a name="nested_named_port"></a>The `named_port` block supports: (Include a `named_port` block for each named-port required).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: - - - <a name="nested_auto_healing_policies"></a>The `auto_healing_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_check`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_delay_sec`
- Description: it applies autohealing policies to new instances or recently recreated instances. Between 0 and 3600. <a name="nested_version"></a>The `version` block supports: ```hcl version { name              = "appserver-canary" instance_template = google_compute_instance_template.appserver-canary.self_link_unique target_size { fixed = 1 } } ``` ```hcl version { name              = "appserver-canary" instance_template = google_compute_instance_template.appserver-canary.self_link_unique target_size { percent = 20 } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_template`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_size`
- Description: -> Exactly one `version` you specify must not have a `target_size` specified. During a rolling update, the instance group manager will fulfill the `target_size` constraints of every other `version`, and any remaining instances will be provisioned with the version where `target_size` is unset. <a name="nested_target_size"></a>The `target_size` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percent`
- Description: Note that when using `percent`, rounding will be in favor of explicitly set `target_size` values; a managed instance group with 2 instances and 2 `version`s, one of which has a `target_size.percent` of `60` will create 2 instances of that `version`. <a name="nested_stateful_disk"></a>The `stateful_disk` block supports: (Include a `stateful_disk` block for each stateful disk required).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_rule`
- Description: <a name="nested_stateful_internal_ip"></a>The `stateful_internal_ip` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_rule`
- Description: <a name="nested_stateful_external_ip"></a>The `stateful_external_ip` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_rule`
- Description: <a name="nested_params"></a>The `params` block supports: ```hcl params{ resource_manager_tags = { "tagKeys/123": "tagValues/123" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: - - - <a name="nested_resource_policies"></a>The `resource_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
