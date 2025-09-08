## 🛡️ Policy Deployment Engine: `eventarc_channel`

This section provides a concise policy evaluation for the `eventarc_channel` resource in GCP.

Reference: [Terraform Registry – eventarc_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_channel)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the channel. Must be unique within the location on the project. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `third_party_provider` | The name of the event provider (e.g. Eventarc SaaS partner) associated with the channel. This provider will be granted permissions to publish events to the channel. Format: `projects/{project}/locations/{location}/providers/{provider_id}`. | false | None | None |
| `crypto_key_name` | Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt their event data. It must match the pattern `projects/*/locations/*/keyRings/*/cryptoKeys/*`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
