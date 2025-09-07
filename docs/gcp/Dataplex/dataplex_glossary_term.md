## 🛡️ Policy Deployment Engine: `dataplex_glossary_term`

This section provides a concise policy evaluation for the `dataplex_glossary_term` resource in GCP.

Reference: [Terraform Registry – dataplex_glossary_term](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_glossary_term)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The immediate parent of the GlossaryTerm in the resource-hierarchy. It can either be a Glossary or a Term. Format: projects/{projectId}/locations/{locationId}/glossaries/{glossaryId} OR projects/{projectId}/locations/{locationId}/glossaries/{glossaryId}/terms/{termId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the glossary term should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly display name of the GlossaryTerm. This is user-mutable. This will be same as the termId, if not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The user-mutable description of the GlossaryTerm.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the GlossaryTerm. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glossary_id`
- Description: (Optional) The glossary id for creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `term_id`
- Description: (Optional) The term id for creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
