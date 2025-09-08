## 🛡️ Policy Deployment Engine: `data_catalog_tag`

This section provides a concise policy evaluation for the `data_catalog_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_tag)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `template` | The resource name of the tag template that this tag uses. Example: projects/{project_id}/locations/{location}/tagTemplates/{tagTemplateId} This field cannot be modified after creation. | true | None | None |
| `column` | Resources like Entry can have schemas associated with them. This scope allows users to attach tags to an individual column based on that schema. For attaching a tag to a nested column, use `.` to separate the column names. Example: `outer_column.inner_column` | false | None | None |
| `parent` | The name of the parent this tag is attached to. This can be the name of an entry or an entry group. If an entry group, the tag will be attached to all entries in that group. | false | None | None |

### fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `field_name` |  | none | None | None |
| `display_name` | (Output) The display name of this field | none | None | None |
| `order` | (Output) The order of this field with respect to other fields in this tag. For example, a higher value can indicate a more important field. The value can be negative. Multiple fields can have the same order, and field orders within a tag do not have to be sequential. | none | None | None |
| `double_value` | Holds the value for a tag field with double type. | false | None | None |
| `string_value` | Holds the value for a tag field with string type. | false | None | None |
| `bool_value` | Holds the value for a tag field with boolean type. | false | None | None |
| `timestamp_value` | Holds the value for a tag field with timestamp type. | false | None | None |
| `enum_value` | Holds the value for a tag field with enum type. This value must be one of the allowed values in the definition of this enum. | false | None | None |
