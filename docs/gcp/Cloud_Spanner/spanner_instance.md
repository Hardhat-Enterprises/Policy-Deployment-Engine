## 🛡️ Policy Deployment Engine: `spanner_instance`

This section provides a concise policy evaluation for the `spanner_instance` resource in GCP.

Reference: [Terraform Registry – spanner_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance)

---

## 1. Argument Reference

### `config`
- Description: (Required) The name of the instance's configuration (similar but not quite the same as a region) which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length. If not provided, a random string starting with `tf-` will be selected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_nodes`
- Description: (Optional) The number of nodes allocated to this instance. Exactly one of either num_nodes, processing_units or autoscaling_config must be present in terraform except when instance_type = FREE_INSTANCE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `processing_units`
- Description: (Optional) The number of processing units allocated to this instance. Exactly one of either num_nodes, processing_units or autoscaling_config must be present in terraform except when instance_type = FREE_INSTANCE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_config`
- Description: (Optional) The autoscaling configuration. Autoscaling is enabled if this field is set. Exactly one of either num_nodes, processing_units or autoscaling_config must be present in terraform except when instance_type = FREE_INSTANCE. When autoscaling is enabled, num_nodes and processing_units are treated as, OUTPUT_ONLY fields and reflect the current compute capacity allocated to the instance. Structure is [documented below](#nested_autoscaling_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edition`
- Description: (Optional) The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: `EDITION_UNSPECIFIED`, `STANDARD`, `ENTERPRISE`, `ENTERPRISE_PLUS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_type`
- Description: (Optional) The type of this instance. The type can be used to distinguish product variants, that can affect aspects like: usage restrictions, quotas and billing. Currently this is used to distinguish FREE_INSTANCE vs PROVISIONED instances. When configured as FREE_INSTANCE, the field `edition` should not be configured. Possible values are: `PROVISIONED`, `FREE_INSTANCE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_backup_schedule_type`
- Description: (Optional) Controls the default backup behavior for new databases within the instance. Note that `AUTOMATIC` is not permitted for free instances, as backups and backup schedules are not allowed for free instances. if unset or NONE, no default backup schedule will be created for new databases within the instance. Possible values are: `NONE`, `AUTOMATIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: This must be set to true if you created a backup manually in the console. <a name="nested_autoscaling_config"></a>The `autoscaling_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_limits`
- Description: (Optional) Defines scale in controls to reduce the risk of response latency and outages due to abrupt scale-in events. Users can define the minimum and maximum compute capacity allocated to the instance, and the autoscaler will only scale within that range. Users can either use nodes or processing units to specify the limits, but should use the same unit to set both the min_limit and max_limit. Structure is [documented below](#nested_autoscaling_config_autoscaling_limits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_targets`
- Description: (Optional) Defines scale in controls to reduce the risk of response latency and outages due to abrupt scale-in events Structure is [documented below](#nested_autoscaling_config_autoscaling_targets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asymmetric_autoscaling_options`
- Description: (Optional) Asymmetric autoscaling options for specific replicas. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options). <a name="nested_autoscaling_config_autoscaling_limits"></a>The `autoscaling_limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_processing_units`
- Description: (Optional) Specifies minimum number of processing units allocated to the instance. If set, this number should be multiples of 1000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_processing_units`
- Description: (Optional) Specifies maximum number of processing units allocated to the instance. If set, this number should be multiples of 1000 and be greater than or equal to min_processing_units.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_nodes`
- Description: (Optional) Specifies number of nodes allocated to the instance. If set, this number should be greater than or equal to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_nodes`
- Description: (Optional) Specifies maximum number of nodes allocated to the instance. If set, this number should be greater than or equal to min_nodes. <a name="nested_autoscaling_config_autoscaling_targets"></a>The `autoscaling_targets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `high_priority_cpu_utilization_percent`
- Description: (Optional) Specifies the target high priority cpu utilization percentage that the autoscaler should be trying to achieve for the instance. This number is on a scale from 0 (no utilization) to 100 (full utilization)..
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_utilization_percent`
- Description: (Optional) Specifies the target storage utilization percentage that the autoscaler should be trying to achieve for the instance. This number is on a scale from 0 (no utilization) to 100 (full utilization). <a name="nested_autoscaling_config_asymmetric_autoscaling_options"></a>The `asymmetric_autoscaling_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_selection`
- Description: (Required) A nested object resource. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_replica_selection).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overrides`
- Description: (Required) A nested object resource. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_overrides). <a name="nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_replica_selection"></a>The `replica_selection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the replica to apply asymmetric autoscaling options. <a name="nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_overrides"></a>The `overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_limits`
- Description: (Required) A nested object resource. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_overrides_autoscaling_limits). <a name="nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_overrides_autoscaling_limits"></a>The `autoscaling_limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_nodes`
- Description: (Required) The minimum number of nodes for this specific replica.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_nodes`
- Description: (Required) The maximum number of nodes for this specific replica.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
