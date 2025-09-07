## 🛡️ Policy Deployment Engine: `logging_project_bucket_config`

This section provides a concise policy evaluation for the `logging_project_bucket_config` resource in GCP.

Reference: [Terraform Registry – logging_project_bucket_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_bucket_config)

---

## 1. Argument Reference

### `project`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locked`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_days`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_analytics`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cmek_settings`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `index_configs`
- Description: <a name="nested_cmek_settings"></a>The `cmek_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: KMS key name format: `'projects/[PROJECT_ID]/locations/[LOCATION]/keyRings/[KEYRING]/cryptoKeys/[KEY]'` To enable CMEK for the bucket, set this field to a valid kmsKeyName for which the associated service account has the required cloudkms.cryptoKeyEncrypterDecrypter roles assigned for the key. The Cloud KMS key used by the bucket can be updated by changing the kmsKeyName to a new valid key name. Encryption operations that are in progress will be completed with the key that was in use when they started. Decryption operations will be completed using the key that was used at the time of encryption unless access to that key has been revoked. See [Enabling CMEK for Logging Buckets](https://cloud.google.com/logging/docs/routing/managed-encryption-storage) for more information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_version_name`
- Description: KMS key name format: `'projects/[PROJECT_ID]/locations/[LOCATION]/keyRings/[KEYRING]/cryptoKeys/[KEY]/cryptoKeyVersions/[VERSION]'` For example: "projects/my-project/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key/cryptoKeyVersions/1" This is a read-only field used to convey the specific configured CryptoKeyVersion of kms_key that has been configured. It will be populated in cases where the CMEK settings are bound to a single key version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_id`
- Description: Before enabling CMEK for a logging bucket, you must first assign the cloudkms.cryptoKeyEncrypterDecrypter role to the service account associated with the project for which CMEK will apply. Use [v2.getCmekSettings](https://cloud.google.com/logging/docs/reference/v2/rest/v2/TopLevel/getCmekSettings#google.logging.v2.ConfigServiceV2.GetCmekSettings) to obtain the service account ID. See [Enabling CMEK for Logging Buckets](https://cloud.google.com/logging/docs/routing/managed-encryption-storage) for more information. <a name="nested_index_configs"></a>The `index_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_path`
- Description: Note that some paths are automatically indexed, and other paths are not eligible for indexing. See [indexing documentation](https://cloud.google.com/logging/docs/analyze/custom-index) for details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
