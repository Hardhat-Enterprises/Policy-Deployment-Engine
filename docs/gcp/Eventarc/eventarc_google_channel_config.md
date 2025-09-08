## 🛡️ Policy Deployment Engine: `eventarc_google_channel_config`

This section provides a concise policy evaluation for the `eventarc_google_channel_config` resource in GCP.

Reference: [Terraform Registry – eventarc_google_channel_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_google_channel_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Required. The resource name of the config. Must be in the format of, `projects/{project}/locations/{location}/googleChannelConfig`. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `crypto_key_name` | Optional. Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt their event data. It must match the pattern `projects/*/locations/*/keyRings/*/cryptoKeys/*`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
