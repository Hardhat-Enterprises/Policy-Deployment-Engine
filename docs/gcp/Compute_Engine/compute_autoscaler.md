## 🛡️ Policy Deployment Engine: `compute_autoscaler`

This section provides a concise policy evaluation for the `compute_autoscaler` resource in GCP.

Reference: [Terraform Registry – compute_autoscaler](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_autoscaler)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_policy`
- Description: (Required) The configuration parameters for the autoscaling algorithm. You can define one or more of the policies for an autoscaler: cpuUtilization, customMetricUtilizations, and loadBalancingUtilization. If none of these are specified, the default will be to autoscale based on cpuUtilization to 0.6 or 60%. Structure is [documented below](#nested_autoscaling_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Required) URL of the managed instance group that this autoscaler will scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) URL of the zone where the instance group resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_autoscaling_policy"></a>The `autoscaling_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_replicas`
- Description: (Required) The minimum number of replicas that the autoscaler can scale down to. This cannot be less than 0. If not provided, autoscaler will choose a default value depending on maximum number of instances allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_replicas`
- Description: (Required) The maximum number of instances that the autoscaler can scale up to. This is required when creating or updating an autoscaler. The maximum number of replicas should not be lower than minimal number of replicas.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cooldown_period`
- Description: (Optional) The number of seconds that the autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. The default time autoscaler waits is 60 seconds. Virtual machine initialization times might vary because of numerous factors. We recommend that you test how long an instance may take to initialize. To do this, create an instance and time the startup process.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Defines operating mode for this policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_down_control`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Defines scale down controls to reduce the risk of response latency and outages due to abrupt scale-in events Structure is [documented below](#nested_autoscaling_policy_scale_down_control).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale_in_control`
- Description: (Optional) Defines scale in controls to reduce the risk of response latency and outages due to abrupt scale-in events Structure is [documented below](#nested_autoscaling_policy_scale_in_control).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_utilization`
- Description: (Optional) Defines the CPU utilization policy that allows the autoscaler to scale based on the average CPU utilization of a managed instance group. Structure is [documented below](#nested_autoscaling_policy_cpu_utilization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric`
- Description: (Optional) Configuration parameters of autoscaling based on a custom metric. Structure is [documented below](#nested_autoscaling_policy_metric).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancing_utilization`
- Description: (Optional) Configuration parameters of autoscaling based on a load balancer. Structure is [documented below](#nested_autoscaling_policy_load_balancing_utilization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scaling_schedules`
- Description: (Optional) Scaling schedules defined for an autoscaler. Multiple schedules can be set on an autoscaler and they can overlap. Structure is [documented below](#nested_autoscaling_policy_scaling_schedules). <a name="nested_autoscaling_policy_scale_down_control"></a>The `scale_down_control` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_scaled_down_replicas`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_autoscaling_policy_scale_down_control_max_scaled_down_replicas).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_window_sec`
- Description: (Optional) How long back autoscaling should look when computing recommendations to include directives regarding slower scale down, as described above. <a name="nested_autoscaling_policy_scale_down_control_max_scaled_down_replicas"></a>The `max_scaled_down_replicas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed`
- Description: (Optional) Specifies a fixed number of VM instances. This must be a positive integer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percent`
- Description: (Optional) Specifies a percentage of instances between 0 to 100%, inclusive. For example, specify 80 for 80%. <a name="nested_autoscaling_policy_scale_in_control"></a>The `scale_in_control` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_scaled_in_replicas`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_autoscaling_policy_scale_in_control_max_scaled_in_replicas).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_window_sec`
- Description: (Optional) How long back autoscaling should look when computing recommendations to include directives regarding slower scale down, as described above. <a name="nested_autoscaling_policy_scale_in_control_max_scaled_in_replicas"></a>The `max_scaled_in_replicas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed`
- Description: (Optional) Specifies a fixed number of VM instances. This must be a positive integer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percent`
- Description: (Optional) Specifies a percentage of instances between 0 to 100%, inclusive. For example, specify 80 for 80%. <a name="nested_autoscaling_policy_cpu_utilization"></a>The `cpu_utilization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Required) The target CPU utilization that the autoscaler should maintain. Must be a float value in the range (0, 1]. If not specified, the default is 0.6. If the CPU level is below the target utilization, the autoscaler scales down the number of instances until it reaches the minimum number of instances you specified or until the average CPU of your instances reaches the target utilization. If the average CPU is above the target utilization, the autoscaler scales up until it reaches the maximum number of instances you specified or until the average utilization reaches the target utilization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predictive_method`
- Description: (Optional) Indicates whether predictive autoscaling based on CPU metric is enabled. Valid values are: - NONE (default). No predictive method is used. The autoscaler scales the group to meet current demand based on real-time metrics. - OPTIMIZE_AVAILABILITY. Predictive autoscaling improves availability by monitoring daily and weekly load patterns and scaling out ahead of anticipated demand. <a name="nested_autoscaling_policy_metric"></a>The `metric` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The identifier (type) of the Stackdriver Monitoring metric. The metric cannot have negative values. The metric must have a value type of INT64 or DOUBLE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `single_instance_assignment`
- Description: (Optional) If scaling is based on a per-group metric value that represents the total amount of work to be done or resource usage, set this value to an amount assigned for a single instance of the scaled group. The autoscaler will keep the number of instances proportional to the value of this metric, the metric itself should not change value due to group resizing. For example, a good metric to use with the target is `pubsub.googleapis.com/subscription/num_undelivered_messages` or a custom metric exporting the total number of requests coming to your instances. A bad example would be a metric exporting an average or median latency, since this value can't include a chunk assignable to a single instance, it could be better used with utilization_target instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Optional) The target value of the metric that autoscaler should maintain. This must be a positive value. A utilization metric scales number of virtual machines handling requests to increase or decrease proportionally to the metric. For example, a good metric to use as a utilizationTarget is www.googleapis.com/compute/instance/network/received_bytes_count. The autoscaler will work to keep this value constant for each of the instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Defines how target utilization value is expressed for a Stackdriver Monitoring metric. Possible values are: `GAUGE`, `DELTA_PER_SECOND`, `DELTA_PER_MINUTE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) A filter string to be used as the filter string for a Stackdriver Monitoring TimeSeries.list API call. This filter is used to select a specific TimeSeries for the purpose of autoscaling and to determine whether the metric is exporting per-instance or per-group data. You can only use the AND operator for joining selectors. You can only use direct equality comparison operator (=) without any functions for each selector. You can specify the metric in both the filter string and in the metric field. However, if specified in both places, the metric must be identical. The monitored resource type determines what kind of values are expected for the metric. If it is a gce_instance, the autoscaler expects the metric to include a separate TimeSeries for each instance in a group. In such a case, you cannot filter on resource labels. If the resource type is any other value, the autoscaler expects this metric to contain values that apply to the entire autoscaled instance group and resource label filtering can be performed to point autoscaler at the correct TimeSeries to scale upon. This is called a per-group metric for the purpose of autoscaling. If not specified, the type defaults to gce_instance. You should provide a filter that is selective enough to pick just one TimeSeries for the autoscaled group or for each of the instances (if you are using gce_instance resource type). If multiple TimeSeries are returned upon the query execution, the autoscaler will sum their respective values to obtain its scaling value. <a name="nested_autoscaling_policy_load_balancing_utilization"></a>The `load_balancing_utilization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Required) Fraction of backend capacity utilization (set in HTTP(s) load balancing configuration) that autoscaler should maintain. Must be a positive float value. If not defined, the default is 0.8. <a name="nested_autoscaling_policy_scaling_schedules"></a>The `scaling_schedules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_required_replicas`
- Description: (Required) Minimum number of VM instances that autoscaler will recommend in time intervals starting according to schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Required) The start timestamps of time intervals when this scaling schedule should provide a scaling signal. This field uses the extended cron format (with an optional year field).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) The time zone to be used when interpreting the schedule. The value of this field must be a time zone name from the tz database: http://en.wikipedia.org/wiki/Tz_database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration_sec`
- Description: (Required) The duration of time intervals (in seconds) for which this scaling schedule will be running. The minimum allowed value is 300.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) A boolean value that specifies if a scaling schedule can influence autoscaler recommendations. If set to true, then a scaling schedule has no effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of a scaling schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
