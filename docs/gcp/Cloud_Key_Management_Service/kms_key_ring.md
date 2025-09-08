## 🛡️ Policy Deployment Engine: `kms_key_ring`

This section provides a concise policy evaluation for the `kms_key_ring` resource in GCP.

Reference: [Terraform Registry – kms_key_ring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for the KeyRing. | true | None | None |
| `location` | The location for the KeyRing. A full list of valid locations can be found by running `gcloud kms locations list`. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
