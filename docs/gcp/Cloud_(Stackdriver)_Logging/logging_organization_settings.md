## 🛡️ Policy Deployment Engine: `logging_organization_settings`

This section provides a concise policy evaluation for the `logging_organization_settings` resource in GCP.

Reference: [Terraform Registry – logging_organization_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `organization` | The organization for which to retrieve or configure settings. | true | None | None |
| `kms_key_name` | The resource name for the configured Cloud KMS key. | false | None | None |
| `storage_location` | The storage location that Cloud Logging will use to create new resources when a location is needed but not explicitly provided. | false | None | None |
| `disable_default_sink` | If set to true, the _Default sink in newly created projects and folders will created in a disabled state. This can be used to automatically disable log storage if there is already an aggregated sink configured in the hierarchy. The _Default sink can be re-enabled manually if needed. | false | None | None |
