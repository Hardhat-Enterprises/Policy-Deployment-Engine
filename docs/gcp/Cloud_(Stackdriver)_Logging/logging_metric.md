## 🛡️ Policy Deployment Engine: `logging_metric`

This section provides a concise policy evaluation for the `logging_metric` resource in GCP.

Reference: [Terraform Registry – logging_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric)

---

## 1. Argument Reference

### `name`
- Description: (Required) The client-assigned metric identifier. Examples - "error_count", "nginx/requests". Metric identifiers are limited to 100 characters and can include only the following characters A-Z, a-z, 0-9, and the special characters _-.,+!*',()%/. The forward-slash character (/) denotes a hierarchy of name pieces, and it cannot be the first character of the name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) An advanced logs filter (https://cloud.google.com/logging/docs/view/advanced-filters) which is used to match log entries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of this metric, which is used in documentation. The maximum length of the description is 8000 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: (Optional) The resource name of the Log Bucket that owns the Log Metric. Only Log Buckets in projects are supported. The bucket has to be in the same project as the metric.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If set to True, then this metric is disabled and it does not generate any points.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_descriptor`
- Description: (Optional) The optional metric descriptor associated with the logs-based metric. If unspecified, it uses a default metric descriptor with a DELTA metric kind, INT64 value type, with no labels and a unit of "1". Such a metric counts the number of log entries matching the filter expression. Structure is [documented below](#nested_metric_descriptor).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `label_extractors`
- Description: (Optional) A map from a label key string to an extractor expression which is used to extract data from a log entry field and assign as the label value. Each label key specified in the LabelDescriptor must have an associated extractor expression in this map. The syntax of the extractor expression is the same as for the valueExtractor field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_extractor`
- Description: (Optional) A valueExtractor is required when using a distribution logs-based metric to extract the values to record from a log entry. Two functions are supported for value extraction - EXTRACT(field) or REGEXP_EXTRACT(field, regex). The argument are 1. field - The name of the log entry field from which the value is to be extracted. 2. regex - A regular expression using the Google RE2 syntax (https://github.com/google/re2/wiki/Syntax) with a single capture group to extract data from the specified log entry field. The value of the field is converted to a string before applying the regex. It is an error to specify a regex that does not include exactly one capture group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_options`
- Description: (Optional) The bucketOptions are required when the logs-based metric is using a DISTRIBUTION value type and it describes the bucket boundaries used to create a histogram of the extracted values. Structure is [documented below](#nested_bucket_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_metric_descriptor"></a>The `metric_descriptor` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unit`
- Description: (Optional) The unit in which the metric value is reported. It is only applicable if the valueType is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The supported units are a subset of [The Unified Code for Units of Measure](http://unitsofmeasure.org/ucum.html) standard
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_type`
- Description: (Required) Whether the measurement is an integer, a floating-point number, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to INT64. Possible values are: `BOOL`, `INT64`, `DOUBLE`, `STRING`, `DISTRIBUTION`, `MONEY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_kind`
- Description: (Required) Whether the metric records instantaneous values, changes to a value, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to DELTA. Possible values are: `DELTA`, `GAUGE`, `CUMULATIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The set of labels that can be used to describe a specific instance of this metric type. For example, the appengine.googleapis.com/http/server/response_latencies metric type has a label for the HTTP response code, response_code, so you can look at latencies for successful responses or just for responses that failed. Structure is [documented below](#nested_metric_descriptor_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A concise name for the metric, which can be displayed in user interfaces. Use sentence case without an ending period, for example "Request count". This field is optional but it is recommended to be set for any metrics associated with user-visible concepts, such as Quota. <a name="nested_metric_descriptor_labels"></a>The `labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) The label key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description for the label.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_type`
- Description: (Optional) The type of data that can be assigned to the label. Default value is `STRING`. Possible values are: `BOOL`, `INT64`, `STRING`. <a name="nested_bucket_options"></a>The `bucket_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linear_buckets`
- Description: (Optional) Specifies a linear sequence of buckets that all have the same width (except overflow and underflow). Each bucket represents a constant absolute uncertainty on the specific value in the bucket. Structure is [documented below](#nested_bucket_options_linear_buckets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exponential_buckets`
- Description: (Optional) Specifies an exponential sequence of buckets that have a width that is proportional to the value of the lower bound. Each bucket represents a constant relative uncertainty on a specific value in the bucket. Structure is [documented below](#nested_bucket_options_exponential_buckets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `explicit_buckets`
- Description: (Optional) Specifies a set of buckets with arbitrary widths. Structure is [documented below](#nested_bucket_options_explicit_buckets). <a name="nested_bucket_options_linear_buckets"></a>The `linear_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_finite_buckets`
- Description: (Required) Must be greater than 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `width`
- Description: (Required) Must be greater than 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `offset`
- Description: (Required) Lower bound of the first bucket. <a name="nested_bucket_options_exponential_buckets"></a>The `exponential_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_finite_buckets`
- Description: (Required) Must be greater than 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `growth_factor`
- Description: (Required) Must be greater than 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Required) Must be greater than 0. <a name="nested_bucket_options_explicit_buckets"></a>The `explicit_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bounds`
- Description: (Required) The values must be monotonically increasing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
