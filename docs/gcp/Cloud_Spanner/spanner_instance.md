## 🛡️ Policy Deployment Engine: `spanner_instance`

This section provides a concise policy evaluation for the `spanner_instance` resource in GCP.

Reference: [Terraform Registry – spanner_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `config` | The name of the instance's configuration (similar but not quite the same as a region) which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances). | true | false | None | None | None |
| `display_name` | The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length. | true | false | None | None | None |
| `name` | A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length. If not provided, a random string starting with `tf-` will be selected. | false | false | None | None | None |
| `num_nodes` | The number of nodes allocated to this instance. Exactly one of either num_nodes, processing_units or autoscaling_config must be present in terraform except when instance_type = FREE_INSTANCE. | false | false | None | None | None |
| `processing_units` | The number of processing units allocated to this instance. Exactly one of either num_nodes, processing_units or autoscaling_config must be present in terraform except when instance_type = FREE_INSTANCE. | false | false | None | None | None |
| `labels` | An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `autoscaling_config` | The autoscaling configuration. Autoscaling is enabled if this field is set. Exactly one of either num_nodes, processing_units or autoscaling_config must be present in terraform except when instance_type = FREE_INSTANCE. When autoscaling is enabled, num_nodes and processing_units are treated as, OUTPUT_ONLY fields and reflect the current compute capacity allocated to the instance. Structure is [documented below](#nested_autoscaling_config). | false | false | None | None | None |
| `edition` | The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: `EDITION_UNSPECIFIED`, `STANDARD`, `ENTERPRISE`, `ENTERPRISE_PLUS`. | false | false | None | None | None |
| `instance_type` | The type of this instance. The type can be used to distinguish product variants, that can affect aspects like: usage restrictions, quotas and billing. Currently this is used to distinguish FREE_INSTANCE vs PROVISIONED instances. When configured as FREE_INSTANCE, the field `edition` should not be configured. Possible values are: `PROVISIONED`, `FREE_INSTANCE`. | false | false | None | None | None |
| `default_backup_schedule_type` | Controls the default backup behavior for new databases within the instance. Note that `AUTOMATIC` is not permitted for free instances, as backups and backup schedules are not allowed for free instances. if unset or NONE, no default backup schedule will be created for new databases within the instance. Possible values are: `NONE`, `AUTOMATIC`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `force_destroy` | This must be set to true if you created a backup manually in the console. | false | false | None | None | None |
| `autoscaling_limits` |  | false | false | None | None | None |
| `autoscaling_targets` |  | false | false | None | None | None |
| `asymmetric_autoscaling_options` |  | false | false | None | None | None |
| `replica_selection` |  | false | false | None | None | None |
| `overrides` |  | false | false | None | None | None |

### autoscaling_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscaling_limits` | Defines scale in controls to reduce the risk of response latency and outages due to abrupt scale-in events. Users can define the minimum and maximum compute capacity allocated to the instance, and the autoscaler will only scale within that range. Users can either use nodes or processing units to specify the limits, but should use the same unit to set both the min_limit and max_limit. Structure is [documented below](#nested_autoscaling_config_autoscaling_limits). | false | false | None | None | None |
| `autoscaling_targets` | Defines scale in controls to reduce the risk of response latency and outages due to abrupt scale-in events Structure is [documented below](#nested_autoscaling_config_autoscaling_targets). | false | false | None | None | None |
| `asymmetric_autoscaling_options` | Asymmetric autoscaling options for specific replicas. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options). | false | false | None | None | None |

### autoscaling_limits Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_processing_units` | Specifies minimum number of processing units allocated to the instance. If set, this number should be multiples of 1000. | false | false | None | None | None |
| `max_processing_units` | Specifies maximum number of processing units allocated to the instance. If set, this number should be multiples of 1000 and be greater than or equal to min_processing_units. | false | false | None | None | None |
| `min_nodes` | The minimum number of nodes for this specific replica. | true | false | None | None | None |
| `max_nodes` | The maximum number of nodes for this specific replica. | true | false | None | None | None |

### autoscaling_targets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `high_priority_cpu_utilization_percent` | Specifies the target high priority cpu utilization percentage that the autoscaler should be trying to achieve for the instance. This number is on a scale from 0 (no utilization) to 100 (full utilization).. | false | false | None | None | None |
| `storage_utilization_percent` | Specifies the target storage utilization percentage that the autoscaler should be trying to achieve for the instance. This number is on a scale from 0 (no utilization) to 100 (full utilization). | false | false | None | None | None |

### asymmetric_autoscaling_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `replica_selection` | A nested object resource. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_replica_selection). | true | false | None | None | None |
| `overrides` | A nested object resource. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_overrides). | true | false | None | None | None |

### replica_selection Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the replica to apply asymmetric autoscaling options. | true | false | None | None | None |

### overrides Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscaling_limits` | A nested object resource. Structure is [documented below](#nested_autoscaling_config_asymmetric_autoscaling_options_asymmetric_autoscaling_options_overrides_autoscaling_limits). | true | false | None | None | None |
