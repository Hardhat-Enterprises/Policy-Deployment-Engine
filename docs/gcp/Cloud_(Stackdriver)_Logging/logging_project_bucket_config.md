## 🛡️ Policy Deployment Engine: `logging_project_bucket_config`

This section provides a concise policy evaluation for the `logging_project_bucket_config` resource in GCP.

Reference: [Terraform Registry – logging_project_bucket_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_bucket_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The project ID where the log bucket will be created. If not provided, the provider project is used. | false | true | Proper project specification ensures log buckets are created in the correct project with appropriate access controls. | my-security-project | untrusted-external-project |
| `location` | The location of the log bucket. Supported locations include 'global', 'us-central1', 'europe-west1', etc. | true | true | Location selection affects data residency and compliance with regional data protection regulations. | europe-west1 | unsupported-region |
| `bucket_id` | The name of the log bucket. Must be unique within the project and location. Bucket IDs must contain only letters, numbers, and hyphens. | true | true | Proper bucket naming helps identify security-related log buckets and maintain organizational standards. | security-audit-logs | bucket_with_invalid@characters |
| `description` | A description of the log bucket, which can help identify its purpose and contents. Maximum length is 8000 characters. | false | false | Descriptions provide documentation but don't directly impact security configuration. | Stores security audit logs for compliance and monitoring purposes | None |
| `locked` | If set to true, the bucket is locked and cannot be modified or deleted. This prevents accidental changes to critical log storage. | false | true | Locking security log buckets prevents unauthorized modification or deletion of critical security data. | True | False |
| `retention_days` | The number of days that log entries in the bucket should be retained. Must be ≥ 1 day. If not set, logs are retained indefinitely. | false | true | Appropriate retention periods ensure compliance with regulatory requirements and security investigation needs. | 365 | 0 |
| `enable_analytics` | If set to true, Log Analytics is enabled for this bucket, providing additional query capabilities and insights. | false | true | Enabling analytics enhances security monitoring capabilities by providing advanced query and analysis features. | True | False |
| `cmek_settings` | Configuration for Customer-Managed Encryption Keys (CMEK) for the log bucket. | false | true | Customer-managed encryption keys provide enhanced security control and compliance with data protection requirements. | Refer to child arguments | Refer to child arguments |
| `index_configs` | Configuration for indexed fields in the log bucket, which enables faster searching and filtering of log entries. | false | true | Proper indexing of security-relevant fields enables efficient security monitoring and incident investigation. | Refer to child arguments | Refer to child arguments |

### cmek_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the CMEK settings. | false | false | The name is automatically generated and doesn't directly impact security. | projects/my-project/locations/global/buckets/my-bucket/cmekSettings | None |
| `kms_key_name` | KMS key name format: `'projects/[PROJECT_ID]/locations/[LOCATION]/keyRings/[KEYRING]/cryptoKeys/[KEY]'` To enable CMEK for the bucket, set this field to a valid kmsKeyName for which the associated service account has the required cloudkms.cryptoKeyEncrypterDecrypter roles assigned for the key. The Cloud KMS key used by the bucket can be updated by changing the kmsKeyName to a new valid key name. | true | true | Proper KMS key configuration ensures encryption of log data at rest with customer-controlled keys. | projects/my-security-project/locations/global/keyRings/logging-keys/cryptoKeys/log-encryption-key | projects/untrusted-project/locations/global/keyRings/keys/cryptoKeys/external-key |
| `kms_key_version_name` | KMS key name format: `'projects/[PROJECT_ID]/locations/[LOCATION]/keyRings/[KEYRING]/cryptoKeys/[KEY]/cryptoKeyVersions/[VERSION]'` This is a read-only field used to convey the specific configured CryptoKeyVersion of kms_key that has been configured. | false | true | Key version tracking helps ensure proper key rotation and cryptographic hygiene. | projects/my-project/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key/cryptoKeyVersions/1 | None |
| `service_account_id` | The service account ID that has the cloudkms.cryptoKeyEncrypterDecrypter role assigned for the KMS key. This is required before enabling CMEK. | false | true | Proper service account configuration ensures the bucket has necessary permissions to encrypt/decrypt data using the KMS key. | service-account@my-project.iam.gserviceaccount.com | incorrect-service-account@wrong-project.iam.gserviceaccount.com |

### index_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_path` | Note that some paths are automatically indexed, and other paths are not eligible for indexing. The path to the field in the log entry to index. | true | true | Indexing security-relevant fields enables efficient security monitoring and threat detection. | jsonPayload.userEmail | non-existent-field-path |
| `type` | The type of data in the indexed field. This determines how the field is indexed and queried. Possible values include 'STRING', 'INTEGER', 'BOOLEAN', 'DOUBLE', 'TIMESTAMP'. | true | false | Field type should match the actual data type but doesn't directly impact security. | STRING | INVALID_TYPE |
