## 🛡️ Policy Deployment Engine: `data_catalog_tag_template`

This section provides a concise policy evaluation for the `data_catalog_tag_template` resource in GCP.

Reference: [Terraform Registry – data_catalog_tag_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_tag_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tag_template_id` | The id of the tag template to create. | true | None | None |
| `display_name` | The display name for this template. | false | None | None |
| `region` | Template location region. | false | None | None |
| `force_delete` | This confirms the deletion of any possible tags using this template. Must be set to true in order to delete the tag template. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `field_id` |  | none | None | None |
| `name` | (Output) The resource name of the tag template field in URL format. Example: projects/{project_id}/locations/{location}/tagTemplates/{tagTemplateId}/fields/{field} | none | None | None |
| `display_name` | The display name for this field. | false | None | None |
| `description` | A description for this field. | false | None | None |
| `type` | The type of value this tag field can contain. Structure is [documented below](#nested_fields_field_type). | true | None | None |
| `is_required` | Whether this is a required field. Defaults to false. | false | None | None |
| `order` | The order of this field with respect to other fields in this tag template. A higher value indicates a more important field. The value can be negative. Multiple fields can have the same order, and field orders within a tag do not have to be sequential. | false | None | None |

### type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `primitive_type` | Represents primitive types - string, bool etc. Exactly one of `primitive_type` or `enum_type` must be set Possible values are: `DOUBLE`, `STRING`, `BOOL`, `TIMESTAMP`. | false | None | None |
| `enum_type` | Represents an enum type. Exactly one of `primitive_type` or `enum_type` must be set Structure is [documented below](#nested_fields_field_type_enum_type). | false | None | None |

### enum_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_values` | The set of allowed values for this enum. The display names of the values must be case-insensitively unique within this set. Currently, enum values can only be added to the list of allowed values. Deletion and renaming of enum values are not supported. Can have up to 500 allowed values. Structure is [documented below](#nested_fields_field_type_enum_type_allowed_values). | true | None | None |

### allowed_values Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The display name of the enum value. | true | None | None |
