## 🛡️ Policy Deployment Engine: `monitoring_slo`

This section provides a concise policy evaluation for the `monitoring_slo` resource in GCP.

Reference: [Terraform Registry – monitoring_slo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_slo)

---

## 1. Argument Reference

### `goal`
- Description: (Required) The fraction of service that must be good in order for this objective to be met. 0 < goal <= 0.999
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) ID of the service to which this SLO belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Name used for UI elements listing this SLO.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rolling_period_days`
- Description: (Optional) A rolling time period, semantically "in the past X days". Must be between 1 to 30 days, inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `calendar_period`
- Description: (Optional) A calendar period, semantically "since the start of the current <calendarPeriod>". Possible values are: `DAY`, `WEEK`, `FORTNIGHT`, `MONTH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_labels`
- Description: (Optional) This field is intended to be used for organizing and identifying the AlertPolicy objects.The field can contain up to 64 entries. Each key and value is limited to 63 Unicode characters or 128 bytes, whichever is smaller. Labels and values can contain only lowercase letters, numerals, underscores, and dashes. Keys must begin with a letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_sli`
- Description: (Optional) Basic Service-Level Indicator (SLI) on a well-known service type. Performance will be computed on the basis of pre-defined metrics. SLIs are used to measure and calculate the quality of the Service's performance with respect to a single aspect of service quality. Exactly one of the following must be set: `basic_sli`, `request_based_sli`, `windows_based_sli` Structure is [documented below](#nested_service_level_indicator_basic_sli).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_based_sli`
- Description: (Optional) A request-based SLI defines a SLI for which atomic units of service are counted directly. A SLI describes a good service. It is used to measure and calculate the quality of the Service's performance with respect to a single aspect of service quality. Exactly one of the following must be set: `basic_sli`, `request_based_sli`, `windows_based_sli` Structure is [documented below](#nested_service_level_indicator_request_based_sli).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `windows_based_sli`
- Description: (Optional) A windows-based SLI defines the criteria for time windows. good_service is defined based off the count of these time windows for which the provided service was of good quality. A SLI describes a good service. It is used to measure and calculate the quality of the Service's performance with respect to a single aspect of service quality. Exactly one of the following must be set: `basic_sli`, `request_based_sli`, `windows_based_sli` Structure is [documented below](#nested_service_level_indicator_windows_based_sli).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `slo_id`
- Description: (Optional) The id to use for this ServiceLevelObjective. If omitted, an id will be generated instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_service_level_indicator_basic_sli"></a>The `basic_sli` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method`
- Description: (Optional) An optional set of RPCs to which this SLI is relevant. Telemetry from other methods will not be used to calculate performance for this SLI. If omitted, this SLI applies to all the Service's methods. For service types that don't support breaking down by method, setting this field will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) An optional set of locations to which this SLI is relevant. Telemetry from other locations will not be used to calculate performance for this SLI. If omitted, this SLI applies to all locations in which the Service has activity. For service types that don't support breaking down by location, setting this field will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The set of API versions to which this SLI is relevant. Telemetry from other API versions will not be used to calculate performance for this SLI. If omitted, this SLI applies to all API versions. For service types that don't support breaking down by version, setting this field will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `latency`
- Description: (Optional) Parameters for a latency threshold SLI. Structure is [documented below](#nested_service_level_indicator_basic_sli_latency).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability`
- Description: (Optional) Availability based SLI, dervied from count of requests made to this service that return successfully. Structure is [documented below](#nested_service_level_indicator_basic_sli_availability). <a name="nested_service_level_indicator_basic_sli_latency"></a>The `latency` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold`
- Description: (Required) A duration string, e.g. 10s. Good service is defined to be the count of requests made to this service that return in no more than threshold. <a name="nested_service_level_indicator_basic_sli_availability"></a>The `availability` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether an availability SLI is enabled or not. Must be set to true. Defaults to `true`. <a name="nested_service_level_indicator_request_based_sli"></a>The `request_based_sli` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `good_total_ratio`
- Description: (Optional) A means to compute a ratio of `good_service` to `total_service`. Defines computing this ratio with two TimeSeries [monitoring filters](https://cloud.google.com/monitoring/api/v3/filters) Must specify exactly two of good, bad, and total service filters. The relationship good_service + bad_service = total_service will be assumed. Exactly one of `distribution_cut` or `good_total_ratio` can be set. Structure is [documented below](#nested_service_level_indicator_request_based_sli_good_total_ratio).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution_cut`
- Description: (Optional) Used when good_service is defined by a count of values aggregated in a Distribution that fall into a good range. The total_service is the total count of all values aggregated in the Distribution. Defines a distribution TimeSeries filter and thresholds used for measuring good service and total service. Exactly one of `distribution_cut` or `good_total_ratio` can be set. Structure is [documented below](#nested_service_level_indicator_request_based_sli_distribution_cut). <a name="nested_service_level_indicator_request_based_sli_good_total_ratio"></a>The `good_total_ratio` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `good_service_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying good service provided. Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. Exactly two of `good_service_filter`,`bad_service_filter`,`total_service_filter` must be set (good + bad = total is assumed).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bad_service_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying bad service provided, either demanded service that was not provided or demanded service that was of inadequate quality. Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. Exactly two of `good_service_filter`,`bad_service_filter`,`total_service_filter` must be set (good + bad = total is assumed).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_service_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying total demanded service. Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. Exactly two of `good_service_filter`,`bad_service_filter`,`total_service_filter` must be set (good + bad = total is assumed). <a name="nested_service_level_indicator_request_based_sli_distribution_cut"></a>The `distribution_cut` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution_filter`
- Description: (Required) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) aggregating values to quantify the good service provided. Must have ValueType = DISTRIBUTION and MetricKind = DELTA or MetricKind = CUMULATIVE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Structure is [documented below](#nested_service_level_indicator_request_based_sli_distribution_cut_range). <a name="nested_service_level_indicator_request_based_sli_distribution_cut_range"></a>The `range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min`
- Description: (Optional) Min value for the range (inclusive). If not given, will be set to 0
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max`
- Description: (Optional) max value for the range (inclusive). If not given, will be set to 0 <a name="nested_service_level_indicator_windows_based_sli"></a>The `windows_based_sli` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_period`
- Description: (Optional) Duration over which window quality is evaluated, given as a duration string "{X}s" representing X seconds. Must be an integer fraction of a day and at least 60s.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `good_bad_metric_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) with ValueType = BOOL. The window is good if any true values appear in the window. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `good_total_ratio_threshold`
- Description: (Optional) Criterion that describes a window as good if its performance is high enough. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_mean_in_range`
- Description: (Optional) Criterion that describes a window as good if the metric's value is in a good range, *averaged* across returned streams. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. Average value X of `time_series` should satisfy `range.min <= X <= range.max` for a good window. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_mean_in_range).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_sum_in_range`
- Description: (Optional) Criterion that describes a window as good if the metric's value is in a good range, *summed* across returned streams. Summed value `X` of `time_series` should satisfy `range.min <= X <= range.max` for a good window. One of `good_bad_metric_filter`, `good_total_ratio_threshold`, `metric_mean_in_range`, `metric_sum_in_range` must be set for `windows_based_sli`. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_sum_in_range). <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold"></a>The `good_total_ratio_threshold` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold`
- Description: (Optional) If window performance >= threshold, the window is counted as good.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `performance`
- Description: (Optional) Request-based SLI to evaluate to judge window quality. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_sli_performance`
- Description: (Optional) Basic SLI to evaluate to judge window quality. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance). <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance"></a>The `performance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `good_total_ratio`
- Description: (Optional) A means to compute a ratio of `good_service` to `total_service`. Defines computing this ratio with two TimeSeries [monitoring filters](https://cloud.google.com/monitoring/api/v3/filters) Must specify exactly two of good, bad, and total service filters. The relationship good_service + bad_service = total_service will be assumed. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_good_total_ratio).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution_cut`
- Description: (Optional) Used when good_service is defined by a count of values aggregated in a Distribution that fall into a good range. The total_service is the total count of all values aggregated in the Distribution. Defines a distribution TimeSeries filter and thresholds used for measuring good service and total service. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_distribution_cut). <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_good_total_ratio"></a>The `good_total_ratio` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `good_service_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying good service provided. Exactly two of good, bad, or total service filter must be defined (where good + bad = total is assumed) Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bad_service_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying bad service provided, either demanded service that was not provided or demanded service that was of inadequate quality. Exactly two of good, bad, or total service filter must be defined (where good + bad = total is assumed) Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_service_filter`
- Description: (Optional) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) quantifying total demanded service. Exactly two of good, bad, or total service filter must be defined (where good + bad = total is assumed) Must have ValueType = DOUBLE or ValueType = INT64 and must have MetricKind = DELTA or MetricKind = CUMULATIVE. <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_distribution_cut"></a>The `distribution_cut` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution_filter`
- Description: (Required) A TimeSeries [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) aggregating values to quantify the good service provided. Must have ValueType = DISTRIBUTION and MetricKind = DELTA or MetricKind = CUMULATIVE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_distribution_cut_range). <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_performance_distribution_cut_range"></a>The `range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min`
- Description: (Optional) Min value for the range (inclusive). If not given, will be set to 0
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max`
- Description: (Optional) max value for the range (inclusive). If not given, will be set to 0 <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance"></a>The `basic_sli_performance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method`
- Description: (Optional) An optional set of RPCs to which this SLI is relevant. Telemetry from other methods will not be used to calculate performance for this SLI. If omitted, this SLI applies to all the Service's methods. For service types that don't support breaking down by method, setting this field will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) An optional set of locations to which this SLI is relevant. Telemetry from other locations will not be used to calculate performance for this SLI. If omitted, this SLI applies to all locations in which the Service has activity. For service types that don't support breaking down by location, setting this field will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The set of API versions to which this SLI is relevant. Telemetry from other API versions will not be used to calculate performance for this SLI. If omitted, this SLI applies to all API versions. For service types that don't support breaking down by version, setting this field will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `latency`
- Description: (Optional) Parameters for a latency threshold SLI. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance_latency).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability`
- Description: (Optional) Availability based SLI, dervied from count of requests made to this service that return successfully. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance_availability). <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance_latency"></a>The `latency` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold`
- Description: (Required) A duration string, e.g. 10s. Good service is defined to be the count of requests made to this service that return in no more than threshold. <a name="nested_service_level_indicator_windows_based_sli_good_total_ratio_threshold_basic_sli_performance_availability"></a>The `availability` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether an availability SLI is enabled or not. Must be set to `true. Defaults to `true`. <a name="nested_service_level_indicator_windows_based_sli_metric_mean_in_range"></a>The `metric_mean_in_range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_series`
- Description: (Required) A [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) specifying the TimeSeries to use for evaluating window The provided TimeSeries must have ValueType = INT64 or ValueType = DOUBLE and MetricKind = GAUGE. Mean value `X` should satisfy `range.min <= X <= range.max` under good service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Mean value `X` of `time_series` values should satisfy `range.min <= X <= range.max` for a good service. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_mean_in_range_range). <a name="nested_service_level_indicator_windows_based_sli_metric_mean_in_range_range"></a>The `range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min`
- Description: (Optional) Min value for the range (inclusive). If not given, will be set to "-infinity", defining an open range "< range.max"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max`
- Description: (Optional) max value for the range (inclusive). If not given, will be set to "infinity", defining an open range ">= range.min" <a name="nested_service_level_indicator_windows_based_sli_metric_sum_in_range"></a>The `metric_sum_in_range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_series`
- Description: (Required) A [monitoring filter](https://cloud.google.com/monitoring/api/v3/filters) specifying the TimeSeries to use for evaluating window quality. The provided TimeSeries must have ValueType = INT64 or ValueType = DOUBLE and MetricKind = GAUGE. Summed value `X` should satisfy `range.min <= X <= range.max` for a good window.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) Range of numerical values. The computed good_service will be the count of values x in the Distribution such that range.min <= x <= range.max. inclusive of min and max. Open ranges can be defined by setting just one of min or max. Summed value `X` should satisfy `range.min <= X <= range.max` for a good window. Structure is [documented below](#nested_service_level_indicator_windows_based_sli_metric_sum_in_range_range). <a name="nested_service_level_indicator_windows_based_sli_metric_sum_in_range_range"></a>The `range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min`
- Description: (Optional) Min value for the range (inclusive). If not given, will be set to "-infinity", defining an open range "< range.max"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max`
- Description: (Optional) max value for the range (inclusive). If not given, will be set to "infinity", defining an open range ">= range.min"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
