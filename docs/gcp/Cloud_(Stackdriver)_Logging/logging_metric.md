## 🛡️ Policy Deployment Engine: `logging_metric`

This section provides a concise policy evaluation for the `logging_metric` resource in GCP.

Reference: [Terraform Registry – logging_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The client-assigned metric identifier. Examples - "error_count", "nginx/requests". Metric identifiers are limited to 100 characters and can include only the following characters A-Z, a-z, 0-9, and the special characters _-.,+!*',()%/. The forward-slash character (/) denotes a hierarchy of name pieces, and it cannot be the first character of the name. | true | None | None |
| `filter` | An advanced logs filter (https://cloud.google.com/logging/docs/view/advanced-filters) which is used to match log entries. | true | None | None |
| `description` | A description of this metric, which is used in documentation. The maximum length of the description is 8000 characters. | false | None | None |
| `bucket_name` | The resource name of the Log Bucket that owns the Log Metric. Only Log Buckets in projects are supported. The bucket has to be in the same project as the metric. | false | None | None |
| `disabled` | If set to True, then this metric is disabled and it does not generate any points. | false | None | None |
| `label_extractors` | A map from a label key string to an extractor expression which is used to extract data from a log entry field and assign as the label value. Each label key specified in the LabelDescriptor must have an associated extractor expression in this map. The syntax of the extractor expression is the same as for the valueExtractor field. | false | None | None |
| `value_extractor` | A valueExtractor is required when using a distribution logs-based metric to extract the values to record from a log entry. Two functions are supported for value extraction - EXTRACT(field) or REGEXP_EXTRACT(field, regex). The argument are 1. field - The name of the log entry field from which the value is to be extracted. 2. regex - A regular expression using the Google RE2 syntax (https://github.com/google/re2/wiki/Syntax) with a single capture group to extract data from the specified log entry field. The value of the field is converted to a string before applying the regex. It is an error to specify a regex that does not include exactly one capture group. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### metric_descriptor Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `unit` | The unit in which the metric value is reported. It is only applicable if the valueType is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The supported units are a subset of [The Unified Code for Units of Measure](http://unitsofmeasure.org/ucum.html) standard | false | None | None |
| `value_type` | Whether the measurement is an integer, a floating-point number, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to INT64. Possible values are: `BOOL`, `INT64`, `DOUBLE`, `STRING`, `DISTRIBUTION`, `MONEY`. | true | None | None |
| `metric_kind` | Whether the metric records instantaneous values, changes to a value, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to DELTA. Possible values are: `DELTA`, `GAUGE`, `CUMULATIVE`. | true | None | None |
| `labels` | The set of labels that can be used to describe a specific instance of this metric type. For example, the appengine.googleapis.com/http/server/response_latencies metric type has a label for the HTTP response code, response_code, so you can look at latencies for successful responses or just for responses that failed. Structure is [documented below](#nested_metric_descriptor_labels). | false | None | None |
| `display_name` | A concise name for the metric, which can be displayed in user interfaces. Use sentence case without an ending period, for example "Request count". This field is optional but it is recommended to be set for any metrics associated with user-visible concepts, such as Quota. | false | None | None |

### bucket_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `linear_buckets` | Specifies a linear sequence of buckets that all have the same width (except overflow and underflow). Each bucket represents a constant absolute uncertainty on the specific value in the bucket. Structure is [documented below](#nested_bucket_options_linear_buckets). | false | None | None |
| `exponential_buckets` | Specifies an exponential sequence of buckets that have a width that is proportional to the value of the lower bound. Each bucket represents a constant relative uncertainty on a specific value in the bucket. Structure is [documented below](#nested_bucket_options_exponential_buckets). | false | None | None |
| `explicit_buckets` | Specifies a set of buckets with arbitrary widths. Structure is [documented below](#nested_bucket_options_explicit_buckets). | false | None | None |

### labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | The label key. | true | None | None |
| `description` | A human-readable description for the label. | false | None | None |
| `value_type` | The type of data that can be assigned to the label. Default value is `STRING`. Possible values are: `BOOL`, `INT64`, `STRING`. | false | None | None |

### linear_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `num_finite_buckets` | Must be greater than 0. | true | None | None |
| `width` | Must be greater than 0. | true | None | None |
| `offset` | Lower bound of the first bucket. | true | None | None |

### exponential_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `num_finite_buckets` | Must be greater than 0. | true | None | None |
| `growth_factor` | Must be greater than 1. | true | None | None |
| `scale` | Must be greater than 0. | true | None | None |

### explicit_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bounds` | The values must be monotonically increasing. | true | None | None |
