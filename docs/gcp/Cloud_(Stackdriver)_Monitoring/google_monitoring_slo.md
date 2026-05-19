## 🛡️ Policy Deployment Engine: `google_monitoring_slo`

This section provides a concise policy evaluation for the `google_monitoring_slo` resource in GCP.

Reference: [Terraform Registry – google_monitoring_slo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_slo)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `goal` | The fraction of service that must be good to meet this objective (0 < goal <= 0.999). | true | false | A numeric performance threshold with no direct security impact. | None | None |
| `service` | ID of the service to which this SLO belongs. | true | false | Identifier field with no security impact. | None | None |
| `display_name` | Name used for UI elements listing this SLO. | false | false | Display metadata with no security impact. | None | None |
| `rolling_period_days` | A rolling time period in days (1–30) for SLO evaluation. | false | false | Evaluation window setting with no security impact. | None | None |
| `calendar_period` | A calendar period for SLO evaluation (DAY, WEEK, FORTNIGHT, MONTH). | false | false | Evaluation window setting with no security impact. | None | None |
| `user_labels` | Labels for organising the SLO. | false | false | Organisational metadata with no security impact. | None | None |
| `slo_id` | Optional ID for the SLO. | false | false | Identifier field with no security impact. | None | None |
| `project` | The project in which the SLO resides. | false | false | Organisational field, not a security control. | None | None |

### basic_sli Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `method` | Set of RPCs to which this SLI is relevant. | false | false | Functional scoping with no security impact. | None | None |
| `location` | Set of locations to which this SLI is relevant. | false | false | Geographic scoping with no security impact. | None | None |
| `version` | Set of API versions to which this SLI is relevant. | false | false | Version scoping with no security impact. | None | None |
| `latency` | Parameters for a latency threshold SLI. | false | false | Performance measurement with no security impact. | None | None |
| `availability` | Availability-based SLI derived from successful requests. | false | false | Performance measurement with no security impact. | None | None |

### request_based_sli Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `good_total_ratio` | Ratio of good service to total service using TimeSeries filters. | false | false | Performance measurement calculation with no security impact. | None | None |
| `distribution_cut` | Good service defined by values falling in a good range of a Distribution. | false | false | Performance measurement calculation with no security impact. | None | None |

### windows_based_sli Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window_period` | Duration over which window quality is evaluated. | false | false | Evaluation window setting with no security impact. | None | None |
| `good_bad_metric_filter` | TimeSeries filter for boolean window quality. | false | false | Performance measurement filter with no security impact. | None | None |
| `good_total_ratio_threshold` | Criterion for a good window based on performance threshold. | false | false | Performance threshold with no security impact. | None | None |
| `metric_mean_in_range` | Criterion for a good window based on metric mean in a range. | false | false | Performance measurement with no security impact. | None | None |
| `metric_sum_in_range` | Criterion for a good window based on metric sum in a range. | false | false | Performance measurement with no security impact. | None | None |

---

## Policies Written

None. Despite having a large number of attributes, this resource is entirely focused on defining Service Level Objectives — performance targets and measurement methodologies. All attributes relate to how performance is calculated and measured, not to access control, encryption, authentication, or network exposure. No security-enforceable controls exist in this resource.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `goal` | A numeric performance target between 0 and 0.999; not a security control |
| `calendar_period` / `rolling_period_days` | Evaluation window settings with no security implications |
| `basic_sli`, `request_based_sli`, `windows_based_sli` | SLI calculation methodologies; define how performance is measured, not how resources are secured |
