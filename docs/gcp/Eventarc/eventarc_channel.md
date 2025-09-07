## 🛡️ Policy Deployment Engine: `eventarc_channel`

This section provides a concise policy evaluation for the `eventarc_channel` resource in GCP.

Reference: [Terraform Registry – eventarc_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_channel)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the channel. Must be unique within the location on the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `third_party_provider`
- Description: (Optional) The name of the event provider (e.g. Eventarc SaaS partner) associated with the channel. This provider will be granted permissions to publish events to the channel. Format: `projects/{project}/locations/{location}/providers/{provider_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_name`
- Description: (Optional) Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt their event data. It must match the pattern `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
