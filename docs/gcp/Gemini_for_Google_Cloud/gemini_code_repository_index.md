## 🛡️ Policy Deployment Engine: `gemini_code_repository_index`

This section provides a concise policy evaluation for the `gemini_code_repository_index` resource in GCP.

Reference: [Terraform Registry – gemini_code_repository_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_repository_index)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the Code Repository Index, for example `us-central1`. | true | true | Location dictates data residency and compliance. Must align with approved regional policy (e.g. AU only). | ['australia-southeast1, australia-southeast2'] | ['us-central1', 'europe-west3'] |
| `code_repository_index_id` | Required. Id of the Code Repository Index. | true | false | Identifier controls naming only. Security risk is minimal provided no sensitive data is embedded in the ID. | ['c', 'c1', 'c2'] | ['anything else'] |
| `labels` | Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are metadata only and do not affect access control or encryption. Should not contain secrets. | None | None |
| `kms_key` | Optional. Immutable. Customer-managed encryption key name, in the format `projects/*/locations/*/keyRings/*/cryptoKeys/*`. | false | true | CMKs ensure data-at-rest encryption is fully customer-controlled. | ['projects/pde/locations/australia-southeast1/keyRings/app/cryptoKeys/code-index'] | Blank |
| `project` | If it is not provided, the provider project is used. | true | false | Required for documentation | PDE | Anything else |
| `force_destroy` | When set to true, the Code Repository Index can be deleted even if it contains content. | false | true | Force deletion bypasses standard safety and retention controls | [False] | [True] |
