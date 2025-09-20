## 🛡️ Policy Deployment Engine: `dataplex_glossary`

This section provides a concise policy evaluation for the `dataplex_glossary` resource in GCP.

Reference: [Terraform Registry – dataplex_glossary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_glossary)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location where the glossary should reside. | true | false | None | None | None |
| `glossary_id` | The glossary id for creation. | true | false | None | None | None |
| `display_name` | User friendly display name of the glossary. This is user-mutable. This will be same as the glossaryId, if not specified. | false | false | None | None | None |
| `description` | The user-mutable description of the glossary. | false | false | None | None | None |
| `labels` | User-defined labels for the Glossary. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
