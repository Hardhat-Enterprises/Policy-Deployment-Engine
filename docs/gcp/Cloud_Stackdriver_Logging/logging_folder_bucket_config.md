## 🛡️ Policy Deployment Engine: `logging_folder_bucket_config`

This section provides a concise policy evaluation for the `logging_folder_bucket_config` resource in GCP.

Reference: [Terraform Registry – logging_folder_bucket_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_bucket_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The folder that will own the logging bucket. Format: folders/FOLDER_ID | true | false | This identifies which folder owns the logging bucket. It has no direct security impact on the bucket's content or access controls. | folders/1234567890 | None |
| `location` | The location (region or multi-region) where the logging bucket will be created. Examples: global, us-central1, eu, asia-southeast1, australia-southeast1 | true | false | Location selection affects data residency requirements and compliance (e.g., GDPR, HIPAA) but does not directly impact security controls like encryption or access management. | australia-southeast1 | None |
| `bucket_id` | The name of the logging bucket. Must be unique within the folder and location. Cannot be modified after creation. | true | false | Bucket ID is a unique identifier for the resource. It has no security implications beyond being a reference name. | audit-log-bucket | None |
| `description` | An optional user-provided description for the logging bucket. Maximum length of 800 characters. | false | false | Description is metadata only and does not affect any security controls, encryption, or access policies. | Centralized logging bucket for folder-level compliance audit logs | None |
| `retention_days` | Number of days that logs will be retained in the bucket. After this period, logs are automatically deleted. Minimum: 1 day, Maximum: 3650 days (10 years). | false | true | Retention period must be sufficient for compliance requirements (CIS GCP Benchmark 2.3 recommends 30+ days for audit logs). Too short retention may result in loss of audit trails required for security investigations and compliance audits. | 90 | 15 |
| `index_configs` | Configuration for custom log field indexing to enable efficient log queries. Indexing improves query performance but may increase storage costs. | false | false | Index configuration affects query performance and cost but does not impact security controls like encryption, access management, or data integrity. | Refer to child arguments | None |

### index_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_path` | Specifies the log field path to be indexed. Note that some paths are automatically indexed, and other paths are not eligible for indexing. See [indexing documentation](https://cloud.google.com/logging/docs/analyze/custom-index) for details. | true | false | Field paths determine which log fields are indexed for faster queries. This has no security implications as indexing does not expose additional data or change access controls. | jsonPayload.request.method | textPayload |
| `type` | The type of data in the field. Determines how the field is indexed and queried. Valid values: TYPE_UNSPECIFIED, STRING, NUMBER, INTEGER, BOOLEAN, TIMESTAMP. | true | false | Field type helps optimize indexing and query performance but has no security implications. | STRING | TYPE_UNSPECIFIED |
