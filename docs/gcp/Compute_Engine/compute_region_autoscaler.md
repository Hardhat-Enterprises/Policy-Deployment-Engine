## 🛡️ Policy Deployment Engine: `compute_region_autoscaler`

This section provides a concise policy evaluation for the `compute_region_autoscaler` resource in GCP.

Reference: [Terraform Registry – compute_region_autoscaler](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. The name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `target` | URL of the managed instance group that this autoscaler will scale. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `region` | URL of the region where the instance group resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### autoscaling_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_replicas` | The minimum number of replicas that the autoscaler can scale down to. This cannot be less than 0. If not provided, autoscaler will choose a default value depending on maximum number of instances allowed. | true | None | None |
| `max_replicas` | The maximum number of instances that the autoscaler can scale up to. This is required when creating or updating an autoscaler. The maximum number of replicas should not be lower than minimal number of replicas. | true | None | None |
| `cooldown_period` | The number of seconds that the autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. The default time autoscaler waits is 60 seconds. Virtual machine initialization times might vary because of numerous factors. We recommend that you test how long an instance may take to initialize. To do this, create an instance and time the startup process. | false | None | None |
| `mode` | Defines operating mode for this policy. | false | None | None |
| `scale_down_control` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Defines scale down controls to reduce the risk of response latency and outages due to abrupt scale-in events Structure is [documented below](#nested_autoscaling_policy_scale_down_control). | false | None | None |
| `scale_in_control` | Defines scale in controls to reduce the risk of response latency and outages due to abrupt scale-in events Structure is [documented below](#nested_autoscaling_policy_scale_in_control). | false | None | None |
| `cpu_utilization` | Defines the CPU utilization policy that allows the autoscaler to scale based on the average CPU utilization of a managed instance group. Structure is [documented below](#nested_autoscaling_policy_cpu_utilization). | false | None | None |
| `metric` | Configuration parameters of autoscaling based on a custom metric. Structure is [documented below](#nested_autoscaling_policy_metric). | false | None | None |
| `load_balancing_utilization` | Configuration parameters of autoscaling based on a load balancer. Structure is [documented below](#nested_autoscaling_policy_load_balancing_utilization). | false | None | None |
| `scaling_schedules` | Scaling schedules defined for an autoscaler. Multiple schedules can be set on an autoscaler and they can overlap. Structure is [documented below](#nested_autoscaling_policy_scaling_schedules). | false | None | None |

### scale_down_control Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_scaled_down_replicas` | A nested object resource. Structure is [documented below](#nested_autoscaling_policy_scale_down_control_max_scaled_down_replicas). | false | None | None |
| `time_window_sec` | How long back autoscaling should look when computing recommendations to include directives regarding slower scale down, as described above. | false | None | None |

### max_scaled_down_replicas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed` | Specifies a fixed number of VM instances. This must be a positive integer. | false | None | None |
| `percent` | Specifies a percentage of instances between 0 to 100%, inclusive. For example, specify 80 for 80%. | false | None | None |

### scale_in_control Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_scaled_in_replicas` | A nested object resource. Structure is [documented below](#nested_autoscaling_policy_scale_in_control_max_scaled_in_replicas). | false | None | None |
| `time_window_sec` | How long back autoscaling should look when computing recommendations to include directives regarding slower scale down, as described above. | false | None | None |

### max_scaled_in_replicas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed` | Specifies a fixed number of VM instances. This must be a positive integer. | false | None | None |
| `percent` | Specifies a percentage of instances between 0 to 100%, inclusive. For example, specify 80 for 80%. | false | None | None |

### cpu_utilization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target` | The target CPU utilization that the autoscaler should maintain. Must be a float value in the range (0, 1]. If not specified, the default is 0.6. If the CPU level is below the target utilization, the autoscaler scales down the number of instances until it reaches the minimum number of instances you specified or until the average CPU of your instances reaches the target utilization. If the average CPU is above the target utilization, the autoscaler scales up until it reaches the maximum number of instances you specified or until the average utilization reaches the target utilization. | true | None | None |
| `predictive_method` | Indicates whether predictive autoscaling based on CPU metric is enabled. Valid values are: - NONE (default). No predictive method is used. The autoscaler scales the group to meet current demand based on real-time metrics. - OPTIMIZE_AVAILABILITY. Predictive autoscaling improves availability by monitoring daily and weekly load patterns and scaling out ahead of anticipated demand. | false | None | None |

### metric Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The identifier (type) of the Stackdriver Monitoring metric. The metric cannot have negative values. The metric must have a value type of INT64 or DOUBLE. | true | None | None |
| `single_instance_assignment` | If scaling is based on a per-group metric value that represents the total amount of work to be done or resource usage, set this value to an amount assigned for a single instance of the scaled group. The autoscaler will keep the number of instances proportional to the value of this metric, the metric itself should not change value due to group resizing. For example, a good metric to use with the target is `pubsub.googleapis.com/subscription/num_undelivered_messages` or a custom metric exporting the total number of requests coming to your instances. A bad example would be a metric exporting an average or median latency, since this value can't include a chunk assignable to a single instance, it could be better used with utilization_target instead. | false | None | None |
| `target` | The target value of the metric that autoscaler should maintain. This must be a positive value. A utilization metric scales number of virtual machines handling requests to increase or decrease proportionally to the metric. For example, a good metric to use as a utilizationTarget is www.googleapis.com/compute/instance/network/received_bytes_count. The autoscaler will work to keep this value constant for each of the instances. | false | None | None |
| `type` | Defines how target utilization value is expressed for a Stackdriver Monitoring metric. Possible values are: `GAUGE`, `DELTA_PER_SECOND`, `DELTA_PER_MINUTE`. | false | None | None |
| `filter` | A filter string to be used as the filter string for a Stackdriver Monitoring TimeSeries.list API call. This filter is used to select a specific TimeSeries for the purpose of autoscaling and to determine whether the metric is exporting per-instance or per-group data. You can only use the AND operator for joining selectors. You can only use direct equality comparison operator (=) without any functions for each selector. You can specify the metric in both the filter string and in the metric field. However, if specified in both places, the metric must be identical. The monitored resource type determines what kind of values are expected for the metric. If it is a gce_instance, the autoscaler expects the metric to include a separate TimeSeries for each instance in a group. In such a case, you cannot filter on resource labels. If the resource type is any other value, the autoscaler expects this metric to contain values that apply to the entire autoscaled instance group and resource label filtering can be performed to point autoscaler at the correct TimeSeries to scale upon. This is called a per-group metric for the purpose of autoscaling. If not specified, the type defaults to gce_instance. You should provide a filter that is selective enough to pick just one TimeSeries for the autoscaled group or for each of the instances (if you are using gce_instance resource type). If multiple TimeSeries are returned upon the query execution, the autoscaler will sum their respective values to obtain its scaling value. | false | None | None |

### load_balancing_utilization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target` | Fraction of backend capacity utilization (set in HTTP(s) load balancing configuration) that autoscaler should maintain. Must be a positive float value. If not defined, the default is 0.8. | true | None | None |

### scaling_schedules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `min_required_replicas` | Minimum number of VM instances that autoscaler will recommend in time intervals starting according to schedule. | true | None | None |
| `schedule` | The start timestamps of time intervals when this scaling schedule should provide a scaling signal. This field uses the extended cron format (with an optional year field). | true | None | None |
| `time_zone` | The time zone to be used when interpreting the schedule. The value of this field must be a time zone name from the tz database: http://en.wikipedia.org/wiki/Tz_database. | false | None | None |
| `duration_sec` | The duration of time intervals (in seconds) for which this scaling schedule will be running. The minimum allowed value is 300. | true | None | None |
| `disabled` | A boolean value that specifies if a scaling schedule can influence autoscaler recommendations. If set to true, then a scaling schedule has no effect. | false | None | None |
| `description` | A description of a scaling schedule. | false | None | None |
