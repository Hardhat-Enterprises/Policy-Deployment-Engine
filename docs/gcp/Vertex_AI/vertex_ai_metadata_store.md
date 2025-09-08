## 🛡️ Policy Deployment Engine: `vertex_ai_metadata_store`

This section provides a concise policy evaluation for the `vertex_ai_metadata_store` resource in GCP.

Reference: [Terraform Registry – vertex_ai_metadata_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_metadata_store)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the MetadataStore. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number. | false | None | None |
| `description` | Description of the MetadataStore. | false | None | None |
| `region` | The region of the Metadata Store. eg us-central1 | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### encryption_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the resource is created. | false | None | None |
