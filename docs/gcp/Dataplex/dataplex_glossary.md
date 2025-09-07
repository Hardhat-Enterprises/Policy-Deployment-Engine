## 🛡️ Policy Deployment Engine: `dataplex_glossary`

This section provides a concise policy evaluation for the `dataplex_glossary` resource in GCP.

Reference: [Terraform Registry – dataplex_glossary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_glossary)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location where the glossary should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glossary_id`
- Description: (Required) The glossary id for creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly display name of the glossary. This is user-mutable. This will be same as the glossaryId, if not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The user-mutable description of the glossary.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the Glossary. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
