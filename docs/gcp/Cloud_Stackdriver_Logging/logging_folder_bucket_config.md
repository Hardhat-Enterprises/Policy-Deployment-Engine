## 🛡️ Policy Deployment Engine: `logging_folder_bucket_config`

This section provides a concise policy evaluation for the `logging_folder_bucket_config` resource in GCP.

Reference: [Terraform Registry – logging_folder_bucket_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_bucket_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The folder to which the logging bucket configuration applies. | true | true | Folder selection ensures the logging bucket is applied to the correct organizational hierarchy and impacts access controls and resource management. | Proper folder ID with appropriate access controls and organizational alignment | Incorrect or unauthorized folder |
| `location` | The location of the logging bucket. This determines where log data is stored and impacts data residency requirements. | true | true | Location selection impacts data residency, compliance with regional regulations, and latency for log access and analysis. | Regions that comply with data residency requirements (e.g., australia-southeast1) | Unapproved or restricted regions that violate data residency policies |
| `bucket_id` | The ID of the logging bucket. This must be unique within the folder and location. | true | true | Bucket ID naming conventions help identify purpose, ownership, and classification of log data for proper security management. | Descriptive names following organizational naming conventions (e.g., security-logs, audit-trails, application-logs) | Generic or unclear names that don't indicate content or purpose |
| `description` | A description of the logging bucket's purpose and contents. | false | true | Clear descriptions help ensure proper classification, retention, and access controls for sensitive log data within the folder hierarchy. | Detailed description of bucket contents, purpose, and folder context | Missing or vague descriptions that don't clarify content sensitivity or purpose |
| `retention_days` | The number of days to retain log entries in this bucket. Setting this to null will use the default retention period. | false | true | Proper retention periods ensure compliance with regulatory requirements while preventing unnecessary long-term storage of sensitive data at the folder level. | Retention periods that meet regulatory requirements (e.g., 365 days for compliance, 30 days for operational logs) | Inadequate retention periods that violate compliance requirements or excessive retention increasing attack surface |
| `index_configs` | Configuration for custom indexes on log fields to enable faster searching and analysis within the folder's log data. | false | true | Index configuration impacts query performance and should be carefully managed to avoid indexing sensitive data unnecessarily within the folder context. | Selective indexing of non-sensitive fields for operational monitoring and troubleshooting | Indexing sensitive PII, security-related fields, or confidential business data that could expose information |

### index_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_path` | Note that some paths are automatically indexed, and other paths are not eligible for indexing. See [indexing documentation](https://cloud.google.com/logging/docs/analyze/custom-index) for details. | true | true | Field path selection for indexing should avoid sensitive data to prevent exposure through search queries within the folder's log data. | Non-sensitive operational fields (e.g., severity, timestamp, resource.type, httpRequest.status) | Sensitive fields containing PII, credentials, security tokens, or business-confidential information |
| `type` | The type of index to create for the field path. Possible values include STRING, INTEGER, etc. | true | true | Index type selection should align with the data type and intended query patterns while considering security implications for folder-level log analysis. | Appropriate index type matching the field data type and query requirements | Mismatched index types that could impact performance, cost, or security monitoring capabilities |
