## 🛡️ Policy Deployment Engine: `logging_folder_settings`

This section provides a concise policy evaluation for the `logging_folder_settings` resource in GCP.

Reference: [Terraform Registry – logging_folder_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_settings)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The folder for which to configure logging settings. This specifies the organizational scope where the logging settings will be applied. | true | true | Proper folder scoping ensures that logging settings are applied to the intended organizational hierarchy and don't inadvertently affect other parts of the organization. | folders/123456789012 | projects/my-project |
| `kms_key_name` | The resource name for the customer-managed Cloud KMS key used to encrypt log data. This provides enhanced security control over log encryption. | false | true | Using customer-managed encryption keys (CMEK) provides greater control over log data encryption and meets regulatory requirements for data protection. | projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-log-key | None |
| `storage_location` | The default storage location that Cloud Logging will use when creating new resources where a location is needed but not explicitly provided. This controls where log data is stored geographically. | false | true | Controlling log storage location is critical for data sovereignty, compliance with regional data protection laws, and minimizing latency for log access. | australia-southeast1 | us-central1 |
| `disable_default_sink` | When set to true, the _Default sink in newly created projects and folders will be created in a disabled state. This helps prevent duplicate log storage when using aggregated sinks. | false | true | Disabling default sinks prevents unnecessary log duplication and reduces storage costs while ensuring all logs are properly captured through centralized aggregated sinks. | True | False |
