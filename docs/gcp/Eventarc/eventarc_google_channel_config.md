## 🛡️ Policy Deployment Engine: `eventarc_google_channel_config`

This section provides a concise policy evaluation for the `eventarc_google_channel_config` resource in GCP.

Reference: [Terraform Registry – eventarc_google_channel_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_google_channel_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) Required. The resource name of the config. Must be in the format of, `projects/{project}/locations/{location}/googleChannelConfig`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_name`
- Description: (Optional) Optional. Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt their event data. It must match the pattern `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
