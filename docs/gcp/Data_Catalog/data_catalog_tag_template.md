## 🛡️ Policy Deployment Engine: `data_catalog_tag_template`

This section provides a concise policy evaluation for the `data_catalog_tag_template` resource in GCP.

Reference: [Terraform Registry – data_catalog_tag_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_tag_template)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fields` | Set of tag template field IDs and the settings for the field. This set is an exhaustive list of the allowed fields. This set must contain at least one field and at most 500 fields. The change of field_id will be resulting in re-creating of field. The change of primitive_type will be resulting in re-creating of field, however if the field is a required, you cannot update it. Structure is [documented below](#nested_fields). | true | false |  | None | None |
| `tag_template_id` | The id of the tag template to create. | true | false |  | None | None |
| `display_name` | The display name for this template. | false | false |  | None | None |
| `region` | Template location region. | false | true | Tag templates should be created only in approved regions to meet data residency and governance requirements. | australia-southeast1 | us-east1 |
| `force_delete` | This confirms the deletion of any possible tags using this template. Must be set to true in order to delete the tag template. | false | true | Force delete can remove templates that are still used by tags, which may cause metadata loss. | false | true |
| `project` | If it is not provided, the provider project is used. | false | true | Tag templates should be created only in approved projects to keep metadata governance in the correct boundary. | gcp-project-12345 | unapproved-project |
| `type` | The type of value this tag field can contain. Structure is documented below. | true | false |  | None | None |
| `enum_type` | Represents an enum type. Exactly one of `primitive_type` or `enum_type` must be set Structure is [documented below](#nested_fields_field_type_enum_type). | false | false |  | None | None |
| `allowed_values` | The set of allowed values for this enum. The display names of the values must be case-insensitively unique within this set. Currently, enum values can only be added to the list of allowed values. Deletion and renaming of enum values are not supported. Can have up to 500 allowed values. Structure is [documented below](#nested_fields_field_type_enum_type_allowed_values). | true | false |  | None | None |

### fields Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_id` | The identifier for this object. Format specified above. | true | false |  | None | None |
| `name` | (Output) The resource name of the tag template field in URL format. Example: projects/{project_id}/locations/{location}/tagTemplates/{tagTemplateId}/fields/{field} | false | false |  | None | None |
| `display_name` | The display name for this field. | false | false |  | None | None |
| `description` | A description for this field. | false | false |  | None | None |
| `type` | The type of value this tag field can contain. Structure is [documented below](#nested_fields_field_type). | true | false |  | None | None |
| `is_required` | Whether this is a required field. Defaults to false. | false | false |  | None | None |
| `order` | The order of this field with respect to other fields in this tag template. A higher value indicates a more important field. The value can be negative. Multiple fields can have the same order, and field orders within a tag do not have to be sequential. | false | false |  | None | None |

### type Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `primitive_type` | Represents primitive types - string, bool etc. Exactly one of `primitive_type` or `enum_type` must be set Possible values are: `DOUBLE`, `STRING`, `BOOL`, `TIMESTAMP`. | false | false |  | None | None |
| `enum_type` | Represents an enum type. Exactly one of `primitive_type` or `enum_type` must be set Structure is [documented below](#nested_fields_field_type_enum_type). | false | false |  | None | None |

### enum_type Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_values` | The set of allowed values for this enum. The display names of the values must be case-insensitively unique within this set. Currently, enum values can only be added to the list of allowed values. Deletion and renaming of enum values are not supported. Can have up to 500 allowed values. Structure is [documented below](#nested_fields_field_type_enum_type_allowed_values). | true | false |  | None | None |

### allowed_values Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name of the enum value. | true | false |  | None | None |
