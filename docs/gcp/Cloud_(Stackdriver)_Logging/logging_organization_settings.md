## 🛡️ Policy Deployment Engine: `logging_organization_settings`

This section provides a concise policy evaluation for the `logging_organization_settings` resource in GCP.

Reference: [Terraform Registry – logging_organization_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_settings)

---

## 1. Argument Reference

### `organization`
- Description: (Required) The organization for which to retrieve or configure settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The resource name for the configured Cloud KMS key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_location`
- Description: (Optional) The storage location that Cloud Logging will use to create new resources when a location is needed but not explicitly provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_default_sink`
- Description: (Optional) If set to true, the _Default sink in newly created projects and folders will created in a disabled state. This can be used to automatically disable log storage if there is already an aggregated sink configured in the hierarchy. The _Default sink can be re-enabled manually if needed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
