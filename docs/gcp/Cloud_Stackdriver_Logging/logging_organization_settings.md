## 🛡️ Policy Deployment Engine: `logging_organization_settings`

This section provides a concise policy evaluation for the `logging_organization_settings` resource in GCP.

Reference: [Terraform Registry – logging_organization_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_settings)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | The organization for which to configure logging settings. Format: organizations/ORGANIZATION_ID | true | false | This identifies which organization's logging settings are being configured. It has no direct security impact on the settings themselves. | organizations/123456789012 | None |
| `kms_key_name` | The resource name for the configured Cloud KMS key used to encrypt log data at rest for the entire organization. Format: projects/KEY_PROJECT_ID/locations/LOCATION/keyRings/KEYRING_NAME/cryptoKeys/KEY_NAME | false | true | Customer-managed encryption keys (CMEK) at the organization level provide control over encryption of all log data across the organization. Without CMEK, Google-managed encryption is used which may not meet compliance requirements for HIPAA, SOC2, or PCI DSS. Organization-level CMEK ensures consistent encryption across all projects. | projects/my-project/locations/global/keyRings/org-logging-keyring/cryptoKeys/org-logging-key | None |
| `storage_location` | The storage location that Cloud Logging will use to create new resources when a location is needed but not explicitly provided. Examples: global, us-central1, eu, asia-southeast1 | false | false | Storage location affects data residency requirements and compliance (e.g., GDPR, HIPAA) but does not directly impact security controls like encryption or access management. | australia-southeast1 | None |
| `disable_default_sink` | If set to true, the _Default sink in newly created projects and folders will be created in a disabled state. This can be used to automatically disable log storage if there is already an aggregated sink configured in the hierarchy. The _Default sink can be re-enabled manually if needed. | false | true | Disabling the _Default sink at the organization level prevents logs from being stored in default logging buckets for all new projects. If not replaced with an alternative aggregated sink, critical logs may be lost across the entire organization, creating massive security blind spots and violating compliance requirements. | false | true |
