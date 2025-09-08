## 🛡️ Policy Deployment Engine: `document_ai_processor`

This section provides a concise policy evaluation for the `document_ai_processor` resource in GCP.

Reference: [Terraform Registry – document_ai_processor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_processor)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of processor. For possible types see the [official list](https://cloud.google.com/document-ai/docs/reference/rest/v1/projects.locations/fetchProcessorTypes#google.cloud.documentai.v1.DocumentProcessorService.FetchProcessorTypes) | true | None | None |
| `display_name` | The display name. Must be unique. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `kms_key_name` | The KMS key used for encryption/decryption in CMEK scenarios. See https://cloud.google.com/security-key-management. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
