## 🛡️ Policy Deployment Engine: `logging_folder_sink`

This section provides a concise policy evaluation for the `logging_folder_sink` resource in GCP.

Reference: [Terraform Registry – logging_folder_sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_sink)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the logging sink. Must be unique within the folder. | true | false | Name is a unique identifier for the sink. It has no security implications beyond being a reference name. | folder-audit-log-sink | None |
| `folder` | The folder that will own the sink. Format: folders/FOLDER_ID | true | false | This identifies which folder owns the sink. It has no direct security impact on the sink's behavior. | folders/1234567890 | None |
| `destination` | The destination where logs will be exported. Supported destinations: Cloud Storage bucket, Pub/Sub topic, BigQuery dataset, or Cloud Logging bucket. Examples: - `storage.googleapis.com/[GCS_BUCKET]` - `bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]` - `pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]` - `logging.googleapis.com/projects/[PROJECT_ID]/locations/global/buckets/[BUCKET_ID]` The writer associated with the sink must have access to write to the above resource. | true | true | Destination determines where logs are exported. Exporting to unauthorized or external destinations can lead to log exfiltration, data leakage, and compliance violations. Destinations must be within the organization's approved projects and follow security best practices. | storage.googleapis.com/audit-logs-bucket | pubsub.googleapis.com/projects/attacker-project/topics/logs |
| `filter` | An advanced logs filter that selects which log entries to export. See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. | false | true | Filter determines which logs are exported. Overly restrictive filters can exclude critical security logs (audit logs, IAM changes, firewall changes), creating blind spots for security monitoring and incident response. | resource.type = "gce_instance" OR logName = "cloudaudit.googleapis.com%2Factivity" | severity < ERROR |
| `description` | A user-provided description of the logging sink. Maximum length of 800 characters. | false | false | Description is metadata only and does not affect any security controls. | Export folder-level audit logs to centralized storage for compliance | None |
| `disabled` | Whether the sink is disabled. If set to true, the sink will not export logs. Default: false. | false | true | If disabled is set to true, log export stops working. Disabling critical log sinks can break security monitoring, compliance reporting, and incident response capabilities. | false | true |
| `include_children` | If set to true, logs from projects under this folder are also exported. If false, only logs from the folder itself are included. Default: false. | false | true | When set to false, logs from child projects may not be exported, creating gaps in security monitoring coverage. For complete visibility, should be set to true unless there are specific organizational requirements to exclude child project logs. | true | false |
| `intercept_children` | If set to true, this sink will take precedence over sinks in child resources (except _Required sinks). This sink will be visible to child resources when listing sinks. Default: false. | false | true | When set to true, this sink can override child sinks, potentially bypassing their exclusions or filters. Should be used carefully to ensure child-level security controls are not unintentionally bypassed. | false | true |
| `bigquery_options` | Options for sinks exporting to BigQuery. Configures how logs are organized in BigQuery tables. | false | false | BigQuery options affect table organization and query performance but have no direct security impact on log data or access controls. | Refer to child arguments | None |
| `exclusions` | Log entries that match any of the exclusion filters will not be exported by the sink. Multiple exclusions can be specified. | false | true | Exclusions allow selective filtering of logs before export. Excluding security-critical logs (audit logs, high severity, IAM changes) creates blind spots and violates compliance requirements. | Refer to child arguments | None |

### bigquery_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `use_partitioned_tables` | By default, Logging creates dated tables based on the log entries' timestamps, e.g. syslog_20170523. With partitioned tables, the date suffix is no longer present and [special query syntax](https://cloud.google.com/bigquery/docs/querying-partitioned-tables) has to be used instead. In both cases, tables are sharded based on UTC timezone. | true | false | Partitioned tables improve query performance and cost management but have no security implications. | true | false |

### exclusions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the exclusion filter. Must be unique within the sink. | true | false | Name is a unique identifier for the exclusion. Has no security implications. | health-check-exclusion | None |
| `description` | A user-provided description of the exclusion filter. | false | false | Description is metadata only and does not affect security controls. | Exclude health check logs from export | None |
| `filter` | An advanced logs filter that matches log entries to be excluded from export. See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. | true | true | Filter determines which logs are excluded from export. Excluding audit logs, IAM changes, or high severity logs creates critical security blind spots. | resource.type = "k8s_container" AND jsonPayload.health_check = true | logName = "cloudaudit.googleapis.com%2Factivity" |
| `disabled` | Whether the exclusion is disabled. If set to true, the exclusion will not be applied. Default: false. | false | false | When disabled, the exclusion stops filtering logs (less risky). Has lower security impact than active exclusions. | false | true |
