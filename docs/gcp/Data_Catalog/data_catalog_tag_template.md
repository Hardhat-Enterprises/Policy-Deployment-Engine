## 🛡️ Policy Deployment Engine: `data_catalog_tag_template`

This section provides a concise policy evaluation for the `data_catalog_tag_template` resource in GCP.

Reference: [Terraform Registry – data_catalog_tag_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_tag_template)

---

## 1. Argument Reference

### `fields`
- Description: (Required) Set of tag template field IDs and the settings for the field. This set is an exhaustive list of the allowed fields. This set must contain at least one field and at most 500 fields. The change of field_id will be resulting in re-creating of field. The change of primitive_type will be resulting in re-creating of field, however if the field is a required, you cannot update it. Structure is [documented below](#nested_fields).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_template_id`
- Description: (Required) The id of the tag template to create.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name for this template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Template location region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_delete`
- Description: (Optional) This confirms the deletion of any possible tags using this template. Must be set to true in order to delete the tag template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_fields"></a>The `fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Output) The resource name of the tag template field in URL format. Example: projects/{project_id}/locations/{location}/tagTemplates/{tagTemplateId}/fields/{field}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name for this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description for this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of value this tag field can contain. Structure is [documented below](#nested_fields_field_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_required`
- Description: (Optional) Whether this is a required field. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `order`
- Description: (Optional) The order of this field with respect to other fields in this tag template. A higher value indicates a more important field. The value can be negative. Multiple fields can have the same order, and field orders within a tag do not have to be sequential. <a name="nested_fields_field_type"></a>The `type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primitive_type`
- Description: (Optional) Represents primitive types - string, bool etc. Exactly one of `primitive_type` or `enum_type` must be set Possible values are: `DOUBLE`, `STRING`, `BOOL`, `TIMESTAMP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_type`
- Description: (Optional) Represents an enum type. Exactly one of `primitive_type` or `enum_type` must be set Structure is [documented below](#nested_fields_field_type_enum_type). <a name="nested_fields_field_type_enum_type"></a>The `enum_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_values`
- Description: (Required) The set of allowed values for this enum. The display names of the values must be case-insensitively unique within this set. Currently, enum values can only be added to the list of allowed values. Deletion and renaming of enum values are not supported. Can have up to 500 allowed values. Structure is [documented below](#nested_fields_field_type_enum_type_allowed_values). <a name="nested_fields_field_type_enum_type_allowed_values"></a>The `allowed_values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The display name of the enum value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
