## 🛡️ Policy Deployment Engine: `dataplex_entry_type`

This section provides a concise policy evaluation for the `dataplex_entry_type` resource in GCP.

Reference: [Terraform Registry – dataplex_entry_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_entry_type)

---

## 1. Argument Reference

### `description`
- Description: (Optional) Description of the EntryType.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the EntryType. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type_aliases`
- Description: (Optional) Indicates the class this Entry Type belongs to, for example, TABLE, DATABASE, MODEL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform`
- Description: (Optional) The platform that Entries of this type belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `system`
- Description: (Optional) The system that Entries of this type belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `required_aspects`
- Description: (Optional) AspectInfo for the entry type. Structure is [documented below](#nested_required_aspects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where entry type will be created in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_type_id`
- Description: (Optional) The entry type id of the entry type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_required_aspects"></a>The `required_aspects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Required aspect type for the entry type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
