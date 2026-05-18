## 🛡️ Policy Deployment Engine: `logging_folder_settings`

This section provides a concise policy evaluation for the `logging_folder_settings` resource in GCP.

Reference: [Terraform Registry – logging_folder_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_settings)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The folder for which to configure logging settings. Format: folders/FOLDER_ID | true | false | This identifies which folder's logging settings are being configured. It has no direct security impact on the settings themselves. | folders/1234567890 | None |
| `kms_key_name` | The resource name for the configured Cloud KMS key used to encrypt log data at rest. Format: projects/KEY_PROJECT_ID/locations/LOCATION/keyRings/KEYRING_NAME/cryptoKeys/KEY_NAME | false | true | Customer-managed encryption keys (CMEK) provide control over encryption of log data. Without CMEK, Google-managed encryption is used which may not meet compliance requirements for HIPAA, SOC2, or PCI DSS. CMEK allows key rotation, revocation, and audit trail of key usage. | projects/my-project/locations/global/keyRings/logging-keyring/cryptoKeys/logging-key | None |
| `storage_location` | The storage location that Cloud Logging will use to create new resources when a location is needed but not explicitly provided. Examples: global, us-central1, eu, asia-southeast1 | false | false | Storage location affects data residency requirements and compliance (e.g., GDPR, HIPAA) but does not directly impact security controls like encryption or access management. | australia-southeast1 | None |
| `disable_default_sink` | If set to true, the _Default sink in newly created projects and folders will be created in a disabled state. This can be used to automatically disable log storage if there is already an aggregated sink configured in the hierarchy. The _Default sink can be re-enabled manually if needed. | false | true | Disabling the _Default sink prevents logs from being stored in the default logging bucket. If not replaced with an alternative aggregated sink, critical logs may be lost, creating security blind spots and violating compliance requirements for log retention. | false | true |
