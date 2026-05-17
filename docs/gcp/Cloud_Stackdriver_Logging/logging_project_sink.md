## 🛡️ Policy Deployment Engine: `logging_project_sink`

This section provides a concise policy evaluation for the `logging_project_sink` resource in GCP.

Reference: [Terraform Registry – logging_project_sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the logging sink. Must be unique within the project. | true | false | Name is a unique identifier for the sink. It has no security implications beyond being a reference name. | audit-log-sink | None |
| `destination` | The destination where logs will be exported. Supported destinations: Cloud Storage bucket, Pub/Sub topic, BigQuery dataset, or Cloud Logging bucket. Examples: - `storage.googleapis.com/[GCS_BUCKET]` - `bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]` - `pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]` - `logging.googleapis.com/projects/[PROJECT_ID]/locations/global/buckets/[BUCKET_ID]` The writer associated with the sink must have access to write to the above resource. | true | true | Destination determines where logs are exported. Exporting to unauthorized or external destinations can lead to log exfiltration, data leakage, and compliance violations. Destinations must be within the organization's approved projects and follow security best practices. | storage.googleapis.com/audit-logs-bucket | pubsub.googleapis.com/projects/attacker-project/topics/logs |
| `filter` | An advanced logs filter that selects which log entries to export. See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. | false | true | Filter determines which logs are exported. Overly restrictive filters can exclude critical security logs (audit logs, IAM changes, firewall changes), creating blind spots for security monitoring and incident response. | resource.type = "gce_instance" OR logName = "cloudaudit.googleapis.com%2Factivity" | severity < ERROR |
| `description` | A user-provided description of the logging sink. Maximum length of 800 characters. | false | false | Description is metadata only and does not affect any security controls. | Export audit logs to centralized storage for compliance | None |
| `disabled` | Whether the sink is disabled. If set to true, the sink will not export logs. Default: false. | false | true | If disabled is set to true, log export stops working. Disabling critical log sinks can break security monitoring, compliance reporting, and incident response capabilities. | false | true |
| `project` | The project that will own the sink. Format: projects/PROJECT_ID. If not provided, the provider project is used. | false | false | This identifies which project owns the sink. It has no direct security impact on the sink's behavior. | projects/my-project | None |
| `unique_writer_identity` | If set to true, a unique service account is created and used for this sink. If you wish to publish logs across projects or utilize bigquery_options, you must set unique_writer_identity to true. | false | true | Unique writer identity creates a dedicated service account for this sink, improving security through isolation and least privilege. Required for cross-project exports and BigQuery options. Without this, the default Logging service account is used, which may have broader permissions. | true | false |
| `custom_writer_identity` | A custom service account email address to be used as the writer identity. The format must be serviceAccount:some@email. This field can only be specified if you are routing logs to a destination outside this sink's project. If not specified, a Logging service account will automatically be generated. | false | true | Custom writer identity allows specifying a specific service account for log export. This provides fine-grained control over permissions and follows the principle of least privilege. The service account must have appropriate permissions on the destination. | serviceAccount:logs-exporter@my-project.iam.gserviceaccount.com | None |
| `bigquery_options` | Options for sinks exporting to BigQuery. Configures how logs are organized in BigQuery tables. Requires unique_writer_identity = true. | false | false | BigQuery options affect table organization and query performance but have no direct security impact on log data or access controls. | Refer to child arguments | None |
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
