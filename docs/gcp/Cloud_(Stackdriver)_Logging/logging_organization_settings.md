## 🛡️ Policy Deployment Engine: `logging_organization_settings`

This section provides a concise policy evaluation for the `logging_organization_settings` resource in GCP.

Reference: [Terraform Registry – logging_organization_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_settings)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | The organization for which to retrieve or configure settings. This should be the numeric organization ID. | true | true | Proper organization specification ensures settings are applied to the correct organizational context with appropriate security controls. | 123456789012 | invalid-org-id |
| `kms_key_name` | The resource name for the configured Cloud KMS key. This key will be used to encrypt log data at rest for the organization. | false | true | Customer-managed encryption keys provide enhanced security control and compliance with data protection requirements. | projects/my-security-project/locations/global/keyRings/logging-keys/cryptoKeys/log-encryption-key | None |
| `storage_location` | The storage location that Cloud Logging will use to create new resources when a location is needed but not explicitly provided. This ensures data residency compliance. | false | true | Controlling storage location ensures compliance with data residency requirements and regional data protection regulations. | europe-west1 | unsupported-region |
| `disable_default_sink` | If set to true, the _Default sink in newly created projects and folders will be created in a disabled state. This can be used to automatically disable log storage if there is already an aggregated sink configured in the hierarchy. The _Default sink can be re-enabled manually if needed. | false | true | Disabling default sinks prevents duplicate log storage and ensures all logs are routed through centralized, security-controlled sinks. | True | False |
