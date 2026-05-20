## 🛡️ Policy Deployment Engine: `google_monitoring_metric_descriptor`

This section provides a concise policy evaluation for the `google_monitoring_metric_descriptor` resource in GCP.

Reference: [Terraform Registry – google_monitoring_metric_descriptor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_metric_descriptor)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The metric type including its DNS name prefix. | true | false | Identifier field with no security impact. | None | None |
| `metric_kind` | Whether the metric records instantaneous values, changes, etc. (GAUGE, DELTA, CUMULATIVE). | true | false | Functional measurement type with no security impact. | None | None |
| `value_type` | The type of measurement value (BOOL, INT64, DOUBLE, STRING, DISTRIBUTION). | true | false | Data type selector with no security impact. | None | None |
| `display_name` | A concise name for the metric shown in user interfaces. | false | false | Display metadata with no security impact. | None | None |
| `description` | A detailed description of the metric. | false | false | Documentation field with no security impact. | None | None |
| `unit` | The units in which the metric value is reported. | false | false | Measurement unit with no security impact. | None | None |
| `launch_stage` | The launch stage of the metric definition (ALPHA, BETA, GA, DEPRECATED, etc.). | false | false | While using DEPRECATED or pre-GA metrics in production is not ideal practice, this applies to custom metric definitions rather than infrastructure security controls. No enforceable security baseline can be applied generically across all use cases. | None | None |
| `project` | The project in which the metric descriptor resides. | false | false | Organisational field, not a security control. | None | None |

### labels Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | The label key. | true | false | Identifier with no security impact. | None | None |
| `value_type` | The type of data assigned to the label (STRING, BOOL, INT64). | false | false | Data type selector with no security impact. | None | None |
| `description` | A human-readable description for the label. | false | false | Documentation field with no security impact. | None | None |

### metadata Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sample_period` | The sampling period of metric data points. | false | false | Operational timing setting with no security impact. | None | None |
| `ingest_delay` | The delay of data points caused by ingestion. | false | false | Operational timing setting with no security impact. | None | None |

---

## Policies Written

None. This resource defines custom metric schemas used for monitoring data collection. All attributes relate to metric structure, data types, and metadata. None present a meaningful security control opportunity.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `launch_stage` | While DEPRECATED or pre-GA metrics are not ideal in production, this applies to custom metric definitions rather than infrastructure security controls and cannot be enforced as a blanket security policy |
