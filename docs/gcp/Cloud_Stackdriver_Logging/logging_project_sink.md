## 🛡️ Policy Deployment Engine: `logging_project_sink`

This section provides a concise policy evaluation for the `logging_project_sink` resource in GCP.

Reference: [Terraform Registry – logging_project_sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the logging sink. Must be unique within the project. Names can contain only letters, numbers, underscores, and hyphens. | true | true | Proper naming helps identify the purpose of log sinks and maintain organizational standards for security monitoring. | security-logs-to-bigquery | sink_with_invalid@characters |
| `destination` | The destination for the logs. Supported destinations include: `storage.googleapis.com/[GCS_BUCKET]`, `bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]`, `pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]`, `logging.googleapis.com/projects/[PROJECT_ID]/locations/global/buckets/[BUCKET_ID]`, `logging.googleapis.com/projects/[PROJECT_ID]`. The writer associated with the sink must have access to write to the destination resource. | true | true | Secure destination configuration ensures logs are stored in trusted, access-controlled environments for security monitoring. | bigquery.googleapis.com/projects/security-monitoring/datasets/audit_logs | storage.googleapis.com/public-bucket |
| `filter` | See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced_filters) for information on how to write a filter. The filter that determines which log entries are exported to the destination. | false | true | Proper filtering ensures that security-relevant logs are captured while reducing noise and storage costs. | resource.type="gce_instance" AND severity>=WARNING | severity<ERROR |
| `description` | A description of the sink, which explains its purpose and what logs it captures. This helps maintain auditability of log routing. | false | false | Clear descriptions provide documentation but don't directly impact security configuration. | Exports security-related logs to BigQuery for analysis and monitoring |  |
| `disabled` | If set to true, the sink is disabled and does not export any log entries. | false | true | Unexpected disabling of security sinks can interrupt security monitoring and incident response capabilities. | False | True |
| `project` | The project ID where the sink should be created. If not provided, the provider project is used. | false | true | Proper project specification ensures sinks are created in the correct project context with appropriate access controls. | my-security-project | untrusted-external-project |
| `unique_writer_identity` | If true, then a unique service account is created and used for this sink. If you wish to publish logs across projects or utilize `bigquery_options`, you must set `unique_writer_identity` to true. | false | true | Unique writer identities provide better security isolation and auditability for cross-project log routing. | True | False |
| `custom_writer_identity` | A custom service account used to write the log entries. The format must be `serviceAccount:some@email`. This field can only be specified if you are routing logs to a destination outside this sink's project. If not specified, a Logging service account will automatically be generated. | false | true | Custom writer identities allow for fine-grained control over permissions and audit trails for cross-project log routing. | serviceAccount:log-writer@my-security-project.iam.gserviceaccount.com | user:regular-user@example.com |
| `bigquery_options` | Options that affect sinks exporting logs to BigQuery. | false | false | BigQuery options affect data organization but don't directly impact security. | Refer to child arguments | Refer to child arguments |
| `exclusions` | Log entries that match any of the exclusion filters are not exported. This allows fine-grained control over what logs are excluded from the sink. | false | true | Proper exclusion configuration prevents security-relevant logs from being accidentally filtered out of security monitoring. | Refer to child arguments | Refer to child arguments |

### bigquery_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `use_partitioned_tables` | By default, Logging creates dated tables based on the log entries' timestamps, e.g. `syslog_20170523`. With partitioned tables the date suffix is no longer present and [special query syntax](https://cloud.google.com/bigquery/docs/querying-partitioned-tables) has to be used instead. In both cases, tables are sharded based on UTC timezone. | false | false | Table partitioning affects query performance and cost but doesn't directly impact security. | True | False |

### exclusions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the exclusion. Must be unique within the sink. | true | true | Proper naming helps identify the purpose of exclusions within security monitoring sinks. | exclude-health-checks | exclusion_with_invalid@characters |
| `description` | A description of the exclusion, which explains why certain logs are being excluded from this sink. | false | false | Clear descriptions provide documentation but don't directly impact security. | Excludes health check logs to reduce noise in security monitoring |  |
| `filter` | See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced_filters) for information on how to write a filter. The filter that determines which log entries to exclude from the sink. | true | true | Carefully crafted exclusion filters prevent security-relevant logs from being accidentally filtered out. | resource.type="gce_instance" AND jsonPayload.MESSAGE:"Health check" | severity<ERROR |
| `disabled` | If set to true, the exclusion is disabled and does not exclude any log entries from the sink. | false | true | Unexpected enabling/disabling of exclusions can affect security monitoring by including sensitive data or excluding security-relevant logs. | False | True |
