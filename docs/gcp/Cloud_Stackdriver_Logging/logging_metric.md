## 🛡️ Policy Deployment Engine: `logging_metric`

This section provides a concise policy evaluation for the `logging_metric` resource in GCP.

Reference: [Terraform Registry – logging_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The client-assigned metric identifier. Examples: 'error_count', 'nginx/requests'. Metric identifiers are limited to 100 characters and can include: A-Z, a-z, 0-9, and _-.,+!*',()%/. The forward-slash (/) denotes hierarchy. Must start with a letter or underscore. | true | false | Name is an identifier for the metric. Has no security implications beyond uniqueness and clarity. | security_iam_role_changes | None |
| `filter` | An advanced logs filter which is used to match log entries for this metric. See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for syntax. | true | true | Filter determines which log entries are counted by this metric. For security monitoring, filters must include critical audit events (IAM changes, firewall changes, VPC changes). Excluding security events creates monitoring blind spots. | logName = "projects/my-project/logs/cloudaudit.googleapis.com%2Factivity" AND protoPayload.methodName = "SetIamPolicy" | severity < ERROR AND logName != "cloudaudit.googleapis.com%2Factivity" |
| `description` | A description of this metric, used in documentation. Maximum length: 8000 characters. | false | false | Description is metadata only and does not affect security controls. | Counts IAM role changes for security monitoring | None |
| `bucket_name` | The resource name of the Log Bucket that owns the Log Metric. Only Log Buckets in projects are supported. The bucket must be in the same project as the metric. | false | false | Bucket name identifies which log bucket contains the metric. Has no direct security impact. | _Default | None |
| `disabled` | If set to True, this metric is disabled and does not generate any data points. | false | true | Disabling security metrics prevents monitoring of critical events (IAM changes, firewall changes, audit config changes), violating CIS GCP Benchmark requirements and creating security blind spots. | false | true |
| `metric_descriptor` | The metric descriptor associated with the logs-based metric. If unspecified, uses default DELTA metric kind, INT64 value type, with no labels and unit of '1' (counts log entries). | false | false | Metric descriptor defines how data is measured and stored. Has no direct security impact on log content or access. | Refer to child arguments | None |
| `label_extractors` | A map from a label key string to an extractor expression used to extract data from a log entry field as the label value. Each label key in LabelDescriptor must have an associated extractor expression. Syntax same as valueExtractor field. | false | false | Label extractors define how label values are derived from log entries. No direct security impact. | {"method": "EXTRACT(protoPayload.methodName)"} | None |
| `value_extractor` | Required for distribution logs-based metrics to extract values from log entries. Supports EXTRACT(field) or REGEXP_EXTRACT(field, regex). The regex must have exactly one capture group. | false | false | Value extractor defines how metric values are derived. No direct security impact. | EXTRACT(protoPayload.response.status) | None |
| `bucket_options` | Required when using DISTRIBUTION value type. Describes bucket boundaries for histogram of extracted values. | false | false | Bucket options define histogram bins for distribution metrics. No security impact. | Refer to child arguments | None |
| `project` | The project ID where the metric will be created. If not provided, the provider project is used. | false | false | Project identifies where the metric is created. No direct security impact. | my-project | None |
| `labels` | Deprecated: Use metric_descriptor.labels instead. | false | false | Deprecated field. No security impact. | None | None |
| `linear_buckets` | Deprecated: Use bucket_options.linear_buckets instead. | false | false | Deprecated field. No security impact. | None | None |
| `exponential_buckets` | Deprecated: Use bucket_options.exponential_buckets instead. | false | false | Deprecated field. No security impact. | None | None |
| `explicit_buckets` | Deprecated: Use bucket_options.explicit_buckets instead. | false | false | Deprecated field. No security impact. | None | None |

### metric_descriptor Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `unit` | The unit in which the metric value is reported. Applicable only if valueType is INT64, DOUBLE, or DISTRIBUTION. Uses UCUM (Unified Code for Units of Measure) standard. | false | false | Unit defines measurement scale. Has no security implications. | 1 | None |
| `value_type` | Whether the measurement is integer, floating-point, etc. Some combinations with metricKind might not be supported. For counter metrics, use INT64. Possible values: BOOL, INT64, DOUBLE, STRING, DISTRIBUTION, MONEY. | true | false | Value type defines data format. Has no security implications. | INT64 | None |
| `metric_kind` | Whether the metric records instantaneous values, changes to a value, etc. For counter metrics, use DELTA. Possible values: DELTA, GAUGE, CUMULATIVE. | true | false | Metric kind defines measurement behavior. Has no security implications. | DELTA | None |
| `labels` | The set of labels that can be used to describe a specific instance of this metric type. For example, response_code label for HTTP latencies. | false | false | Labels add dimensions to metrics. Has no direct security impact. | Refer to child arguments | None |
| `display_name` | A concise name for the metric, displayed in user interfaces. Use sentence case without ending period. Recommended for user-visible metrics. | false | false | Display name is for UI presentation. Has no security implications. | IAM Role Change Count | None |

### bucket_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `linear_buckets` | Specifies linear sequence of buckets with equal width (except overflow/underflow). | false | false | Linear buckets define histogram bins. No security implications. | Refer to child arguments | None |
| `exponential_buckets` | Specifies exponential sequence of buckets with width proportional to lower bound value. | false | false | Exponential buckets define histogram bins. No security implications. | Refer to child arguments | None |
| `explicit_buckets` | Specifies a set of buckets with arbitrary widths. | false | false | Explicit buckets define histogram bins. No security implications. | Refer to child arguments | None |

### labels Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | The label key. | true | false | Label key identifier. No security impact. | response_code | None |
| `description` | A human-readable description for the label. | false | false | Description is metadata only. | HTTP response status code | None |
| `value_type` | The type of data that can be assigned to the label. Default: STRING. Possible values: BOOL, INT64, STRING. | false | false | Value type defines label data format. No security impact. | INT64 | None |

### linear_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `num_finite_buckets` | Number of finite buckets. Must be greater than 0. | true | false | Defines histogram bin count. No security impact. | 10 | None |
| `width` | Width of each bucket. Must be greater than 0. | true | false | Defines bucket width. No security impact. | 5 | None |
| `offset` | Lower bound of the first bucket. | true | false | Defines bucket starting point. No security impact. | 0 | None |

### exponential_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `num_finite_buckets` | Number of finite buckets. Must be greater than 0. | true | false | Defines histogram bin count. No security impact. | 10 | None |
| `growth_factor` | Growth factor for bucket sizes. Must be greater than 1. | true | false | Defines bucket growth rate. No security impact. | 2 | None |
| `scale` | Scale factor for buckets. Must be greater than 0. | true | false | Defines bucket scaling. No security impact. | 1 | None |

### explicit_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bounds` | Bucket boundary values. Must be monotonically increasing. | true | false | Defines bucket boundaries. No security impact. | [0, 10, 50, 100] | None |
