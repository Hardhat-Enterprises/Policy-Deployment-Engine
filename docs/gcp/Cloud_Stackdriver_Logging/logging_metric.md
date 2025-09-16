## 🛡️ Policy Deployment Engine: `logging_metric`

This section provides a concise policy evaluation for the `logging_metric` resource in GCP.

Reference: [Terraform Registry – logging_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The client-assigned metric identifier. Examples - "error_count", "nginx/requests". Metric identifiers are limited to 100 characters and can include only the following characters A-Z, a-z, 0-9, and the special characters _-.,+!*',()%/. The forward-slash character (/) denotes a hierarchy of name pieces, and it cannot be the first character of the name. | true | true | Proper naming conventions help identify security-related metrics and maintain organizational standards for monitoring. | security/authentication_failures | metric-with-invalid@characters-and-more-than-100-characters-which-exceeds-the-limit-and-is-not-compliant |
| `filter` | An advanced logs filter (https://cloud.google.com/logging/docs/view/advanced-filters) which is used to match log entries. | true | true | Well-defined filters ensure security-relevant log entries are properly captured for monitoring and alerting. | resource.type="gce_instance" AND severity>=ERROR | severity>=INFO |
| `description` | A description of this metric, which is used in documentation. The maximum length of the description is 8000 characters. | false | false | Descriptions help document the purpose of the metric but don't directly impact security. | Tracks authentication failures across all GCE instances for security monitoring. | None |
| `bucket_name` | The resource name of the Log Bucket that owns the Log Metric. Only Log Buckets in projects are supported. The bucket has to be in the same project as the metric. | false | true | Using appropriate log buckets ensures proper retention and access control for security-related metrics. | projects/my-project/locations/global/buckets/security-logs | projects/another-project/locations/global/buckets/security-logs |
| `disabled` | If set to True, then this metric is disabled and it does not generate any points. | false | true | Disabling security metrics prevents monitoring of critical security events. | False | True |
| `metric_descriptor` | The optional metric descriptor associated with the logs-based metric. If unspecified, it uses a default metric descriptor with a DELTA metric kind, INT64 value type, with no labels and a unit of "1". Such a metric counts the number of log entries matching the filter expression. Structure is [documented below](#nested_metric_descriptor). | false | true | Proper metric configuration ensures accurate tracking and alerting of security events. | Refer to child arguments | Refer to child arguments |
| `label_extractors` | A map from a label key string to an extractor expression which is used to extract data from a log entry field and assign as the label value. Each label key specified in the LabelDescriptor must have an associated extractor expression in this map. The syntax of the extractor expression is the same as for the valueExtractor field. | false | true | Proper label extraction enables detailed security analysis and filtering of security events. | {"source_ip": "EXTRACT(httpRequest.remoteIp)"} | {"invalid_label": "INVALID_EXTRACT(unknownField)"} |
| `value_extractor` | A valueExtractor is required when using a distribution logs-based metric to extract the values to record from a log entry. Two functions are supported for value extraction - EXTRACT(field) or REGEXP_EXTRACT(field, regex). The argument are 1. field - The name of the log entry field from which the value is to be extracted. 2. regex - A regular expression using the Google RE2 syntax (https://github.com/google/re2/wiki/Syntax) with a single capture group to extract data from the specified log entry field. The value of the field is converted to a string before applying the regex. It is an error to specify a regex that does not include exactly one capture group. | false | true | Proper value extraction ensures accurate measurement of security-related metrics. | EXTRACT(latency) | REGEXP_EXTRACT(message, "invalid(regex") |
| `bucket_options` | The bucketOptions are required when the logs-based metric is using a DISTRIBUTION value type and it describes the bucket boundaries used to create a histogram of the extracted values. Structure is [documented below](#nested_bucket_options). | false | false | Bucket configuration affects data distribution but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |
| `project` | If it is not provided, the provider project is used. | false | true | Project specification ensures metrics are created in the correct environment with proper access controls. | my-security-project | untrusted-external-project |
| `labels` | Labels for the metric descriptor that define additional metadata. | false | true | Proper labeling helps categorize and manage security metrics effectively. | Refer to child arguments | Refer to child arguments |
| `linear_buckets` | Configuration for linear bucket distribution in metrics. | false | false | Bucket distribution affects data analysis but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |
| `exponential_buckets` | Configuration for exponential bucket distribution in metrics. | false | false | Bucket distribution affects data analysis but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |
| `explicit_buckets` | Configuration for explicit bucket distribution in metrics. | false | false | Bucket distribution affects data analysis but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |

### metric_descriptor Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `unit` | The unit in which the metric value is reported. It is only applicable if the valueType is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The supported units are a subset of [The Unified Code for Units of Measure](http://unitsofmeasure.org/ucum.html) standard | false | false | Unit specification provides context but doesn't directly impact security. | 1 | invalid-unit |
| `value_type` | Whether the measurement is an integer, a floating-point number, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to INT64. Possible values are: `BOOL`, `INT64`, `DOUBLE`, `STRING`, `DISTRIBUTION`, `MONEY`. | true | false | Value type selection should match the data being measured but doesn't directly impact security. | INT64 | STRING |
| `metric_kind` | Whether the metric records instantaneous values, changes to a value, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to DELTA. Possible values are: `DELTA`, `GAUGE`, `CUMULATIVE`. | true | false | Metric kind should align with the measurement type but doesn't directly impact security. | DELTA | GAUGE |
| `labels` | The set of labels that can be used to describe a specific instance of this metric type. For example, the appengine.googleapis.com/http/server/response_latencies metric type has a label for the HTTP response code, response_code, so you can look at latencies for successful responses or just for responses that failed. Structure is [documented below](#nested_metric_descriptor_labels). | false | true | Proper labeling enables granular security monitoring and filtering of security events. | Refer to child arguments | Refer to child arguments |
| `display_name` | A concise name for the metric, which can be displayed in user interfaces. Use sentence case without an ending period, for example "Request count". This field is optional but it is recommended to be set for any metrics associated with user-visible concepts, such as Quota. | false | false | Display name helps with usability but doesn't directly impact security. | Authentication failures count | None |

### bucket_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `linear_buckets` | Specifies a linear sequence of buckets that all have the same width (except overflow and underflow). Each bucket represents a constant absolute uncertainty on the specific value in the bucket. Structure is [documented below](#nested_bucket_options_linear_buckets). | false | false | Bucket distribution affects data analysis but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |
| `exponential_buckets` | Specifies an exponential sequence of buckets that have a width that is proportional to the value of the lower bound. Each bucket represents a constant relative uncertainty on a specific value in the bucket. Structure is [documented below](#nested_bucket_options_exponential_buckets). | false | false | Bucket distribution affects data analysis but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |
| `explicit_buckets` | Specifies a set of buckets with arbitrary widths. Structure is [documented below](#nested_bucket_options_explicit_buckets). | false | false | Bucket distribution affects data analysis but doesn't directly impact security. | Refer to child arguments | Refer to child arguments |

### labels Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | The label key. | true | true | Label keys help organize and filter security metrics for monitoring and alerting. | security_severity | invalid-key-with@special-chars |
| `description` | A human-readable description for the label. | false | false | Label descriptions provide context but don't directly impact security. | Indicates the severity level of security events | None |
| `value_type` | The type of data that can be assigned to the label. Default value is `STRING`. Possible values are: `BOOL`, `INT64`, `STRING`. | false | false | Value type should match the data being labeled but doesn't directly impact security. | STRING | INVALID_TYPE |

### linear_buckets Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `num_finite_buckets` | Must be greater than 0. | true | false | Bucket count affects data granularity but doesn't directly impact security. | 5 | 0 |
| `width` | Must be greater than 0. | true | false | Bucket width affects data distribution but doesn't directly impact security. | 10 | 0 |
| `offset` | Lower bound of the first bucket. | true | false | Bucket offset affects data range but doesn't directly impact security. | 0 | -10 |

### exponential_buckets Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `num_finite_buckets` | Must be greater than 0. | true | false | Bucket count affects data granularity but doesn't directly impact security. | 4 | 0 |
| `growth_factor` | Must be greater than 1. | true | false | Growth factor affects bucket distribution but doesn't directly impact security. | 2 | 1 |
| `scale` | Must be greater than 0. | true | false | Scale affects bucket distribution but doesn't directly impact security. | 1 | 0 |

### explicit_buckets Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bounds` | The values must be monotonically increasing. | true | false | Bucket bounds affect data distribution but don't directly impact security. | [0, 10, 20, 30, 40] | [40, 30, 20, 10, 0] |
