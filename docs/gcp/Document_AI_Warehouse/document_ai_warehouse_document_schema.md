## 🛡️ Policy Deployment Engine: `document_ai_warehouse_document_schema`

This section provides a concise policy evaluation for the `document_ai_warehouse_document_schema` resource in GCP.

Reference: [Terraform Registry – document_ai_warehouse_document_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_warehouse_document_schema)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Name of the schema given by the user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `property_definitions`
- Description: (Required) Defines the metadata for a schema property. Structure is [documented below](#nested_property_definitions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_number`
- Description: (Required) The unique identifier of the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `document_is_folder`
- Description: (Optional) Tells whether the document is a folder or a typical document. <a name="nested_property_definitions"></a>The `property_definitions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the metadata property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display-name for the property, used for front-end.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_repeatable`
- Description: (Optional) Whether the property can have multiple values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_filterable`
- Description: (Optional) Whether the property can be filtered. If this is a sub-property, all the parent properties must be marked filterable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_searchable`
- Description: (Optional) Indicates that the property should be included in a global search.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_metadata`
- Description: (Optional) Whether the property is user supplied metadata.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_required`
- Description: (Optional) Whether the property is mandatory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retrieval_importance`
- Description: (Optional) Stores the retrieval importance. Possible values are: `HIGHEST`, `HIGHER`, `HIGH`, `MEDIUM`, `LOW`, `LOWEST`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_sources`
- Description: (Optional) The schema source information. Structure is [documented below](#nested_property_definitions_property_definitions_schema_sources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_type_options`
- Description: (Optional) Integer property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `float_type_options`
- Description: (Optional) Float property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text_type_options`
- Description: (Optional) Text/string property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `property_type_options`
- Description: (Optional) Nested structured data property. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_type_options`
- Description: (Optional) Enum/categorical property. Structure is [documented below](#nested_property_definitions_property_definitions_enum_type_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `date_time_type_options`
- Description: (Optional) Date time property. Not supported by CMEK compliant deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `map_type_options`
- Description: (Optional) Map property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timestamp_type_options`
- Description: (Optional) Timestamp property. Not supported by CMEK compliant deployment. <a name="nested_property_definitions_property_definitions_schema_sources"></a>The `schema_sources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The schema name in the source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `processor_type`
- Description: (Optional) The Doc AI processor type name. <a name="nested_property_definitions_property_definitions_property_type_options"></a>The `property_type_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `property_definitions`
- Description: (Required) Defines the metadata for a schema property. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options_property_definitions). <a name="nested_property_definitions_property_definitions_property_type_options_property_definitions"></a>The `property_definitions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the metadata property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display-name for the property, used for front-end.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_repeatable`
- Description: (Optional) Whether the property can have multiple values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_filterable`
- Description: (Optional) Whether the property can be filtered. If this is a sub-property, all the parent properties must be marked filterable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_searchable`
- Description: (Optional) Indicates that the property should be included in a global search.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_metadata`
- Description: (Optional) Whether the property is user supplied metadata.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_required`
- Description: (Optional) Whether the property is mandatory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retrieval_importance`
- Description: (Optional) Stores the retrieval importance. Possible values are: `HIGHEST`, `HIGHER`, `HIGH`, `MEDIUM`, `LOW`, `LOWEST`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_sources`
- Description: (Optional) The schema source information. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options_property_definitions_property_definitions_schema_sources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_type_options`
- Description: (Optional) Integer property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `float_type_options`
- Description: (Optional) Float property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text_type_options`
- Description: (Optional) Text property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_type_options`
- Description: (Optional) Enum/categorical property. Structure is [documented below](#nested_property_definitions_property_definitions_property_type_options_property_definitions_property_definitions_enum_type_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `date_time_type_options`
- Description: (Optional) Date time property. Not supported by CMEK compliant deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `map_type_options`
- Description: (Optional) Map property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timestamp_type_options`
- Description: (Optional) Timestamp property. Not supported by CMEK compliant deployment. <a name="nested_property_definitions_property_definitions_property_type_options_property_definitions_property_definitions_schema_sources"></a>The `schema_sources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The schema name in the source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `processor_type`
- Description: (Optional) The Doc AI processor type name. <a name="nested_property_definitions_property_definitions_property_type_options_property_definitions_property_definitions_enum_type_options"></a>The `enum_type_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `possible_values`
- Description: (Required) List of possible enum values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validation_check_disabled`
- Description: (Optional) Make sure the enum property value provided in the document is in the possile value list during document creation. The validation check runs by default. <a name="nested_property_definitions_property_definitions_enum_type_options"></a>The `enum_type_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `possible_values`
- Description: (Required) List of possible enum values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validation_check_disabled`
- Description: (Optional) Make sure the enum property value provided in the document is in the possile value list during document creation. The validation check runs by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
