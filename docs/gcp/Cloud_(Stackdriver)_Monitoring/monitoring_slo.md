## 🛡️ Policy Deployment Engine: `monitoring_slo`

This section provides a concise policy evaluation for the `monitoring_slo` resource in GCP.

Reference: [Terraform Registry – monitoring_slo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_slo)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `goal` | The fraction of service that must be good in order for this objective to be met. 0 < goal <= 0.999 | true | None | None |
| `service` | ID of the service to which this SLO belongs. | true | None | None |
| `display_name` | Name used for UI elements listing this SLO. | false | None | None |
| `rolling_period_days` | A rolling time period, semantically "in the past X days". Must be between 1 to 30 days, inclusive. | false | None | None |
| `calendar_period` | A calendar period, semantically "since the start of the current <calendarPeriod>". Possible values are: `DAY`, `WEEK`, `FORTNIGHT`, `MONTH`. | false | None | None |
| `user_labels` | This field is intended to be used for organizing and identifying the AlertPolicy objects.The field can contain up to 64 entries. Each key and value is limited to 63 Unicode characters or 128 bytes, whichever is smaller. Labels and values can contain only lowercase letters, numerals, underscores, and dashes. Keys must begin with a letter. | false | None | None |
| `slo_id` | The id to use for this ServiceLevelObjective. If omitted, an id will be generated instead. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### basic_sli Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `method` | An optional set of RPCs to which this SLI is relevant. Telemetry from other methods will not be used to calculate performance for this SLI. If omitted, this SLI applies to all the Service's methods. For service types that don't support breaking down by method, setting this field will result in an error. | false | None | None |
| `location` | An optional set of locations to which this SLI is relevant. Telemetry from other locations will not be used to calculate performance for this SLI. If omitted, this SLI applies to all locations in which the Service has activity. For service types that don't support breaking down by location, setting this field will result in an error. | false | None | None |
| `version` | The set of API versions to which this SLI is relevant. Telemetry from other API versions will not be used to calculate performance for this SLI. If omitted, this SLI applies to all API versions. For service types that don't support breaking down by version, setting this field will result in an error. | false | None | None |
| `latency` | Parameters for a latency threshold SLI. Structure is [documented below](#nested_service_level_indicator_basic_sli_latency). | false | None | None |
| `availability` | Availability based SLI, dervied from count of requests made to this service that return successfully. Structure is [documented below](#nested_service_level_indicator_basic_sli_availability). | false | None | None |

### request_based_sli Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `good_total_ratio` | A means to compute a ratio of `good_service` to `total_service`. Defines computing this ratio with two TimeSeries [monitoring filters](https://cloud.google.com/monitoring/api/v3/filters) Must specify exactly two of good, bad, and total service filters. The relationship good_service + bad_service = total_service will be assumed. Exactly one of `distribution_cut` or `good_total_ratio` can be set. Structure is [documented below](#nested_service_level_indicator_request_based_sli_good_total_ratio). | false | None | None |
| `distribution_cut` | Used when good_service is defined by a count of values aggregated in a Distribution that fall into a good range. The total_service is the total count of all values aggregated in the Distribution. Defines a distribution TimeSeries filter and thresholds used for measuring good service and total service. Exactly one of `distribution_cut` or `good_total_ratio` can be set. Structure is [documented below](#nested_service_level_indicator_request_based_sli_distribution_cut). | false | None | None |

### windows_based_sli Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `window_period` | Duration over which window quality is evaluated, given as a duration string "{X}s" representing X seconds. Must be an integer fraction of a day and at least 60s. | false | None | None |
| `good_bad_metric_filter` | A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) with ValueType = BOOL. The window is good if any true values appear in the window. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. | false | None | None |
| `good_total_ratio_threshold` | Criterion that describes a window as good if its performance is high enough. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold). | false | None | None |
| `metric_mean_in_range` | Criterion that describes a window as good if the metric's value is in a good range, *averaged* across returned streams. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. Average value X of `time_series` should satisfy `range.min <= X <= range.max` for a good window. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_mean_in_range). | false | None | None |
| `metric_sum_in_range` | Criterion that describes a window as good if the metric's value is in a good range, *summed* across returned streams. Summed value `X` of `time_series` should satisfy `range.min <= X <= range.max` for a good window. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_sum_in_range). | false | None | None |

### latency Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `threshold` | A duration string, e.g. 10s. Good service is defined to be the count of requests made to this service that return in no more than threshold. | true | None | None |

### availability Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether an availability SLI is enabled or not. Must be set to `true. Defaults to `true`. | false | None | None |

### good_total_ratio Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `good_service_filter` | A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying good service provided. Exactly two of good, bad, or total service filter must be defined (where good + bad = total is assumed) Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. | false | None | None |
| `bad_service_filter` | A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying bad service provided, either demanded service that was not provided or demanded service that was of inadequate quality. Exactly two of good, bad, or total service filter must be defined (where good + bad = total is assumed) Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. | false | None | None |
| `total_service_filter` | A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying total demanded service. Exactly two of good, bad, or total service filter must be defined (where good + bad = total is assumed) Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. | false | None | None |

### distribution_cut Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `distribution_filter` | A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) aggregating values to quantify the good service provided. Must have ValueType = DISTRIBUTION and MetricKind = DELTA or MetricKind = CUMULATIVE. | true | None | None |
| `range` | Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_distribution_cut_range). | true | None | None |

### range Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min` | Min value for the range (inclusive). If not given, will be set to "-infinity", defining an open range "< range.max" | false | None | None |
| `max` | max value for the range (inclusive). If not given, will be set to "infinity", defining an open range ">= range.min" | false | None | None |

### good_total_ratio_threshold Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `threshold` | If window performance >= threshold, the window is counted as good. | false | None | None |
| `performance` | Request-based SLI to evaluate to judge window quality. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance). | false | None | None |
| `basic_sli_performance` | Basic SLI to evaluate to judge window quality. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance). | false | None | None |

### performance Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `good_total_ratio` | A means to compute a ratio of `good_service` to `total_service`. Defines computing this ratio with two TimeSeries [monitoring filters](https://cloud.google.com/monitoring/api/v3/filters) Must specify exactly two of good, bad, and total service filters. The relationship good_service + bad_service = total_service will be assumed. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_good_total_ratio). | false | None | None |
| `distribution_cut` | Used when good_service is defined by a count of values aggregated in a Distribution that fall into a good range. The total_service is the total count of all values aggregated in the Distribution. Defines a distribution TimeSeries filter and thresholds used for measuring good service and total service. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_distribution_cut). | false | None | None |

### basic_sli_performance Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `method` | An optional set of RPCs to which this SLI is relevant. Telemetry from other methods will not be used to calculate performance for this SLI. If omitted, this SLI applies to all the Service's methods. For service types that don't support breaking down by method, setting this field will result in an error. | false | None | None |
| `location` | An optional set of locations to which this SLI is relevant. Telemetry from other locations will not be used to calculate performance for this SLI. If omitted, this SLI applies to all locations in which the Service has activity. For service types that don't support breaking down by location, setting this field will result in an error. | false | None | None |
| `version` | The set of API versions to which this SLI is relevant. Telemetry from other API versions will not be used to calculate performance for this SLI. If omitted, this SLI applies to all API versions. For service types that don't support breaking down by version, setting this field will result in an error. | false | None | None |
| `latency` | Parameters for a latency threshold SLI. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance_latency). | false | None | None |
| `availability` | Availability based SLI, dervied from count of requests made to this service that return successfully. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance_availability). | false | None | None |

### metric_mean_in_range Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `time_series` | A [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) specifying the TimeSeries to use for evaluating window The provided TimeSeries must have ValueType = INT64 or ValueType = DOUBLE and MetricKind = GAUGE. Mean value `X` should satisfy `range.min <= X <= range.max` under good service. | true | None | None |
| `range` | Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Mean value `X` of `time_series` values should satisfy `range.min <= X <= range.max` for a good service. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_mean_in_range_range). | true | None | None |

### metric_sum_in_range Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `time_series` | A [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) specifying the TimeSeries to use for evaluating window quality. The provided TimeSeries must have ValueType = INT64 or ValueType = DOUBLE and MetricKind = GAUGE. Summed value `X` should satisfy `range.min <= X <= range.max` for a good window. | true | None | None |
| `range` | Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Summed value `X` should satisfy `range.min <= X <= range.max` for a good window. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_sum_in_range_range). | true | None | None |
