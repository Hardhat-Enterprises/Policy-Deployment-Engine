## 🛡️ Policy Deployment Engine: `logging_organization_bucket_config`

This section provides a concise policy evaluation for the `logging_organization_bucket_config` resource in GCP.

Reference: [Terraform Registry – logging_organization_bucket_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_bucket_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | The organization ID in which the log bucket should be created. This should be the numeric organization ID. | true | true | Proper organization specification ensures log buckets are created in the correct organizational context with appropriate access controls. | 123456789012 | invalid-org-name |
| `location` | The location of the log bucket. This can be a global location or a specific region. Supported locations include 'global', 'us-central1', 'europe-west1', etc. | true | true | Location selection affects data residency and compliance with regional data protection regulations. | europe-west1 | unsupported-region |
| `bucket_id` | The name of the log bucket. Must be unique within the organization and location. Bucket IDs must contain only letters, numbers, and hyphens. | true | true | Proper bucket naming helps identify security-related log buckets and maintain organizational standards. | security-audit-logs | bucket_with_invalid@characters |
| `description` | A description of the log bucket, which can help identify its purpose and contents. Maximum length is 8000 characters. | false | false | Descriptions provide documentation but don't directly impact security configuration. | Stores security audit logs for compliance and monitoring purposes | None |
| `retention_days` | The number of days that log entries in the bucket should be retained. Must be ≥ 1 day. If not set, logs are retained indefinitely. | false | true | Appropriate retention periods ensure compliance with regulatory requirements and security investigation needs. | 365 | 0 |
| `index_configs` | Configuration for indexed fields in the log bucket, which enables faster searching and filtering of log entries. | false | true | Proper indexing of security-relevant fields enables efficient security monitoring and incident investigation. | Refer to child arguments | Refer to child arguments |

### index_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_path` | Note that some paths are automatically indexed, and other paths are not eligible for indexing. See [indexing documentation](https://cloud.google.com/logging/docs/analyze/custom-index) for details. The path to the field in the log entry to index. | true | true | Indexing security-relevant fields enables efficient security monitoring and threat detection. | jsonPayload.userEmail | non-existent-field-path |
| `type` | The type of data in the indexed field. This determines how the field is indexed and queried. Possible values include 'STRING', 'INTEGER', 'BOOLEAN', 'DOUBLE', 'TIMESTAMP'. | true | false | Field type should match the actual data type but doesn't directly impact security. | STRING | INVALID_TYPE |
