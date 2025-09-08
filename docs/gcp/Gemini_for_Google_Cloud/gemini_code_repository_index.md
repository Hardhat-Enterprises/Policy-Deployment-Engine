## 🛡️ Policy Deployment Engine: `gemini_code_repository_index`

This section provides a concise policy evaluation for the `gemini_code_repository_index` resource in GCP.

Reference: [Terraform Registry – gemini_code_repository_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_repository_index)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the Code Repository Index, for example `us-central1`. | true | None | None |
| `code_repository_index_id` | Required. Id of the Code Repository Index. | true | None | None |
| `labels` | Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `kms_key` | Optional. Immutable. Customer-managed encryption key name, in the format `projects/*/locations/*/keyRings/*/cryptoKeys/*`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `force_destroy` |  | none | None | None |
