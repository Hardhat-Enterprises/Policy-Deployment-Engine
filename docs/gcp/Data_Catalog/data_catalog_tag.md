## 🛡️ Policy Deployment Engine: `data_catalog_tag`

This section provides a concise policy evaluation for the `data_catalog_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_tag)

---

## 1. Argument Reference

### `template`
- Description: (Required) The resource name of the tag template that this tag uses. Example: projects/{project_id}/locations/{location}/tagTemplates/{tagTemplateId} This field cannot be modified after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fields`
- Description: (Required) This maps the ID of a tag field to the value of and additional information about that field. Valid field IDs are defined by the tag's template. A tag must have at least 1 field and at most 500 fields. Structure is [documented below](#nested_fields).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Resources like Entry can have schemas associated with them. This scope allows users to attach tags to an individual column based on that schema. For attaching a tag to a nested column, use `.` to separate the column names. Example: `outer_column.inner_column`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The name of the parent this tag is attached to. This can be the name of an entry or an entry group. If an entry group, the tag will be attached to all entries in that group. <a name="nested_fields"></a>The `fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) The display name of this field
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `order`
- Description: (Output) The order of this field with respect to other fields in this tag. For example, a higher value can indicate a more important field. The value can be negative. Multiple fields can have the same order, and field orders within a tag do not have to be sequential.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `double_value`
- Description: (Optional) Holds the value for a tag field with double type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) Holds the value for a tag field with string type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bool_value`
- Description: (Optional) Holds the value for a tag field with boolean type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timestamp_value`
- Description: (Optional) Holds the value for a tag field with timestamp type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_value`
- Description: (Optional) Holds the value for a tag field with enum type. This value must be one of the allowed values in the definition of this enum.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
