## 🛡️ Policy Deployment Engine: `data_catalog_tag`

This section provides a concise policy evaluation for the `data_catalog_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_tag)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `template` | The resource name of the tag template that this tag uses. Example: projects/{project_id}/locations/{location}/tagTemplates/{tagTemplateId} This field cannot be modified after creation. | true | true | Tags should use approved templates so required governance metadata follows the expected structure. | approved_tag_template | unapproved_tag_template |
| `fields` | This maps the ID of a tag field to the value of and additional information about that field. Valid field IDs are defined by the tag's template. A tag must have at least 1 field and at most 500 fields. Structure is [documented below](#nested_fields). | true | false |  | None | None |
| `column` | Resources like Entry can have schemas associated with them. This scope allows users to attach tags to an individual column based on that schema. For attaching a tag to a nested column, use `.` to separate the column names. Example: `outer_column.inner_column` | false | false |  | None | None |
| `parent` | The name of the parent this tag is attached to. This can be the name of an entry or an entry group. If an entry group, the tag will be attached to all entries in that group. | false | true | Tags should be attached only to approved Data Catalog resources to avoid marking unmanaged assets. | approved_data_catalog_entry | unapproved_data_catalog_entry |

### fields Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_name` | The identifier for this object. Format specified above. | true | false |  | None | None |
| `display_name` | (Output) The display name of this field | false | false |  | None | None |
| `order` | (Output) The order of this field with respect to other fields in this tag. For example, a higher value can indicate a more important field. The value can be negative. Multiple fields can have the same order, and field orders within a tag do not have to be sequential. | false | false |  | None | None |
| `double_value` | Holds the value for a tag field with double type. | false | false |  | None | None |
| `string_value` | Holds the value for a tag field with string type. | false | false |  | None | None |
| `bool_value` | Holds the value for a tag field with boolean type. | false | false |  | None | None |
| `timestamp_value` | Holds the value for a tag field with timestamp type. | false | false |  | None | None |
| `enum_value` | Holds the value for a tag field with enum type. This value must be one of the allowed values in the definition of this enum. | false | false |  | None | None |
