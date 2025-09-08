## 🛡️ Policy Deployment Engine: `kms_key_handle`

This section provides a concise policy evaluation for the `kms_key_handle` resource in GCP.

Reference: [Terraform Registry – kms_key_handle](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_handle)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for the KeyHandle. | true | None | None |
| `resource_type_selector` | Selector of the resource type where we want to protect resources. For example, `storage.googleapis.com/Bucket`. | true | None | None |
| `location` | The location for the KeyHandle. A full list of valid locations can be found by running `gcloud kms locations list`. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
