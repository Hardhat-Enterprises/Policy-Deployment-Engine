## 🛡️ Policy Deployment Engine: `document_ai_processor_default_version`

This section provides a concise policy evaluation for the `document_ai_processor_default_version` resource in GCP.

Reference: [Terraform Registry – document_ai_processor_default_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_processor_default_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | The version to set. Using `stable` or `rc` will cause the API to return the latest version in that release channel. Apply `lifecycle.ignore_changes` to the `version` field to suppress this diff. | true | None | None |
| `processor` | The processor to set the version on. | true | None | None |
