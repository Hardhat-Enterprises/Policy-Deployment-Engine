## 🛡️ Policy Deployment Engine: `document_ai_warehouse_document_schema`

This section provides a concise policy evaluation for the `document_ai_warehouse_document_schema` resource in GCP.

Reference: [Terraform Registry – document_ai_warehouse_document_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_warehouse_document_schema)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Name of the schema given by the user. | true | None | None |
| `project_number` | The unique identifier of the project. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `document_is_folder` | Tells whether the document is a folder or a typical document. | false | None | None |

### property_definitions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the metadata property. | true | None | None |
| `display_name` | The display-name for the property, used for front-end. | false | None | None |
| `is_repeatable` | Whether the property can have multiple values. | false | None | None |
| `is_filterable` | Whether the property can be filtered. If this is a sub-property, all the parent properties must be marked filterable. | false | None | None |
| `is_searchable` | Indicates that the property should be included in a global search. | false | None | None |
| `is_metadata` | Whether the property is user supplied metadata. | false | None | None |
| `is_required` | Whether the property is mandatory. | false | None | None |
| `retrieval_importance` | Stores the retrieval importance. Possible values are: `HIGHEST`, `HIGHER`, `HIGH`, `MEDIUM`, `LOW`, `LOWEST`. | false | None | None |
| `schema_sources` | The schema source information. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options_property_definitions_property_definitions_schema_sources). | false | None | None |
| `integer_type_options` | Integer property. | false | None | None |
| `float_type_options` | Float property. | false | None | None |
| `text_type_options` | Text property. | false | None | None |
| `property_type_options` | Nested structured data property. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options). | false | None | None |
| `enum_type_options` | Enum/categorical property. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options_property_definitions_property_definitions_enum_type_options). | false | None | None |
| `date_time_type_options` | Date time property. Not supported by CMEK compliant deployment. | false | None | None |
| `map_type_options` | Map property. | false | None | None |
| `timestamp_type_options` | Timestamp property. Not supported by CMEK compliant deployment. | false | None | None |

### schema_sources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The schema name in the source. | false | None | None |
| `processor_type` | The Doc AI processor type name. | false | None | None |

### property_type_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `property_definitions` | Defines the metadata for a schema property. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options_property_definitions). | true | None | None |

### enum_type_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `possible_values` | List of possible enum values. | true | None | None |
| `validation_check_disabled` | Make sure the enum property value provided in the document is in the possile value list during document creation. The validation check runs by default. | false | None | None |
