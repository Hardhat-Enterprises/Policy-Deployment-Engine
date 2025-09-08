## 🛡️ Policy Deployment Engine: `dataplex_glossary_category`

This section provides a concise policy evaluation for the `dataplex_glossary_category` resource in GCP.

Reference: [Terraform Registry – dataplex_glossary_category](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_glossary_category)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The immediate parent of the GlossaryCategory in the resource-hierarchy. It can either be a Glossary or a Category. Format: projects/{projectId}/locations/{locationId}/glossaries/{glossaryId} OR projects/{projectId}/locations/{locationId}/glossaries/{glossaryId}/categories/{categoryId} | true | None | None |
| `location` | The location where the glossary category should reside. | true | None | None |
| `display_name` | User friendly display name of the GlossaryCategory. This is user-mutable. This will be same as the categoryId, if not specified. | false | None | None |
| `description` | The user-mutable description of the GlossaryCategory. | false | None | None |
| `labels` | User-defined labels for the GlossaryCategory. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `glossary_id` | The glossary id for creation. | false | None | None |
| `category_id` | The category id for creation. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
