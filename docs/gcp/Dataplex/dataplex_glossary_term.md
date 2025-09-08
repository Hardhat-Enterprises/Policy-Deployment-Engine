## 🛡️ Policy Deployment Engine: `dataplex_glossary_term`

This section provides a concise policy evaluation for the `dataplex_glossary_term` resource in GCP.

Reference: [Terraform Registry – dataplex_glossary_term](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_glossary_term)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The immediate parent of the GlossaryTerm in the resource-hierarchy. It can either be a Glossary or a Term. Format: projects/{projectId}/locations/{locationId}/glossaries/{glossaryId} OR projects/{projectId}/locations/{locationId}/glossaries/{glossaryId}/terms/{termId} | true | None | None |
| `location` | The location where the glossary term should reside. | true | None | None |
| `display_name` | User friendly display name of the GlossaryTerm. This is user-mutable. This will be same as the termId, if not specified. | false | None | None |
| `description` | The user-mutable description of the GlossaryTerm. | false | None | None |
| `labels` | User-defined labels for the GlossaryTerm. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `glossary_id` | The glossary id for creation. | false | None | None |
| `term_id` | The term id for creation. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
