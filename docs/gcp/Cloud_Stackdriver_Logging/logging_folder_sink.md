## 🛡️ Policy Deployment Engine: `logging_folder_sink`

This section provides a concise policy evaluation for the `logging_folder_sink` resource in GCP.

Reference: [Terraform Registry – logging_folder_sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_sink)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the logging sink. Must be unique within the folder and helps identify the purpose of the sink. | true | false | While the name itself doesn't impact security, proper naming conventions help with identification, management, and auditing of logging sinks. | security-audit-logs-to-bigquery | sink1 |
| `folder` | The folder to which this logging sink applies. This specifies the organizational scope where the sink will collect and export logs. | true | true | Proper folder scoping ensures that logging sinks only collect logs from intended resources and don't inadvertently capture logs from unrelated parts of the organization. | folders/123456789012 | projects/my-project |
| `destination` | The destination where the logs will be exported. Supported destinations include Cloud Storage, BigQuery, Pub/Sub, and Logging buckets. The sink's service account must have write permissions to the destination. | true | true | The destination choice impacts log security, retention, and accessibility. Secure destinations with proper access controls are essential for protecting sensitive log data. | bigquery.googleapis.com/projects/security-project/datasets/audit_logs | storage.googleapis.com/public-bucket |
| `filter` | The filter that determines which log entries are exported by this sink. Uses Google Cloud Logging's advanced filter language to specify criteria for log selection. | false | true | Proper filtering ensures that only relevant logs are exported, reducing storage costs and ensuring critical security logs are captured without unnecessary noise. | resource.type="gce_instance" AND severity>=WARNING | severity<INFO |
| `description` | A human-readable description explaining the purpose, scope, and configuration of this logging sink. | false | true | Clear documentation of sink purposes helps maintain audit trails, ensures proper configuration management, and aids in security investigations. | Exports all GCE instance warning and error logs to BigQuery for security analysis and compliance auditing | export some logs |
| `disabled` | Whether the logging sink is disabled. If true, the sink will not export any logs. | false | true | Disabled sinks should be carefully monitored as they may indicate broken log collection pipelines or security monitoring gaps. | False | True |
| `include_children` | Whether to include logs from all child projects of the folder. If true, logs from child projects are also exported; otherwise only logs relating to the provided folder are included. | false | true | This setting determines the scope of log collection and impacts both cost and security monitoring coverage across the organizational hierarchy. | True | False |
| `intercept_children` | Whether this sink should intercept and match with sinks in child resources, except _Required sinks. This sink will be visible to child resources when listing sinks. | false | true | Intercepting child sinks can help centralize log management but may conflict with project-specific logging requirements if not properly coordinated. | False | True |
| `bigquery_options` | Configuration options for BigQuery destinations. Controls how log data is structured and stored in BigQuery tables. | false | true | BigQuery configuration options impact query performance, cost efficiency, and data accessibility for log analysis and security investigations. | None | None |
| `exclusions` | List of exclusion rules that specify which log entries should be excluded from this sink, even if they match the sink's filter. | false | true | Exclusions must be carefully configured to avoid inadvertently filtering out security-critical logs while reducing noise and storage costs. | None | None |

### bigquery_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `use_partitioned_tables` | Whether to use BigQuery partitioned tables instead of date-sharded tables. Partitioned tables require special query syntax but offer better performance and cost management for large datasets. | false | false | This is primarily a performance and cost optimization feature that doesn't directly impact security, though it affects query efficiency for security investigations. | True | False |

### exclusions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the exclusion rule. Must be unique within the sink. | true | false | Proper naming helps identify and manage exclusion rules, though the name itself doesn't impact security. | exclude-health-checks | exclusion1 |
| `description` | A description explaining why certain log entries are being excluded from the sink. | false | true | Documenting exclusion rationales helps maintain audit trails and ensures security teams understand why certain logs are being filtered out. | Excludes high-volume health check logs to reduce storage costs while maintaining security-relevant logging | exclude noisy logs |
| `filter` | The filter that determines which log entries to exclude from the sink. Uses Google Cloud Logging's advanced filter language. | true | true | Exclusion filters must be precise to avoid inadvertently filtering security-critical logs while reducing unnecessary log volume. | resource.type="gce_instance" AND severity<ERROR AND protoPayload.methodName:"health.check" | resource.type="gce_instance" |
| `disabled` | Whether the exclusion rule is disabled. If true, the exclusion filter is not applied. | false | true | Disabled exclusions should be monitored as they may indicate incomplete logging configuration or security controls. | False | True |
