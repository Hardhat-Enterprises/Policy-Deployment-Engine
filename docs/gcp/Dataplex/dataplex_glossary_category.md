## 🛡️ Policy Deployment Engine: `dataplex_glossary_category`

This section provides a concise policy evaluation for the `dataplex_glossary_category` resource in GCP.

Reference: [Terraform Registry – dataplex_glossary_category](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_glossary_category)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The immediate parent of the GlossaryCategory in the resource-hierarchy. It can either be a Glossary or a Category. Format: projects/{projectId}/locations/{locationId}/glossaries/{glossaryId} OR projects/{projectId}/locations/{locationId}/glossaries/{glossaryId}/categories/{categoryId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the glossary category should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly display name of the GlossaryCategory. This is user-mutable. This will be same as the categoryId, if not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The user-mutable description of the GlossaryCategory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the GlossaryCategory. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glossary_id`
- Description: (Optional) The glossary id for creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `category_id`
- Description: (Optional) The category id for creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
