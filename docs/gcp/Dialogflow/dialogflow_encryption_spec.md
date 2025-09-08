## 🛡️ Policy Deployment Engine: `dialogflow_encryption_spec`

This section provides a concise policy evaluation for the `dialogflow_encryption_spec` resource in GCP.

Reference: [Terraform Registry – dialogflow_encryption_spec](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_encryption_spec)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location in which the encryptionSpec is to be initialized. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### encryption_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | The name of customer-managed encryption key that is used to secure a resource and its sub-resources. If empty, the resource is secured by the default Google encryption key. Only the key in the same location as this resource is allowed to be used for encryption. Format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{key} | true | None | None |
