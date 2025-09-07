## 🛡️ Policy Deployment Engine: `firestore_index`

This section provides a concise policy evaluation for the `firestore_index` resource in GCP.

Reference: [Terraform Registry – firestore_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_index)

---

## 1. Argument Reference

### `collection`
- Description: (Required) The collection being indexed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fields`
- Description: (Required) The fields supported by this index. The last non-stored field entry is always for the field path `__name__`. If, on creation, `__name__` was not specified as the last field, it will be added automatically with the same direction as that of the last field defined. If the final field in a composite index is not directional, the `__name__` will be ordered `"ASCENDING"` (unless explicitly specified otherwise). Structure is [documented below](#nested_fields).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Optional) The Firestore database id. Defaults to `"(default)"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_scope`
- Description: (Optional) The scope at which a query is run. Default value is `COLLECTION`. Possible values are: `COLLECTION`, `COLLECTION_GROUP`, `COLLECTION_RECURSIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_scope`
- Description: (Optional) The API scope at which a query is run. Default value is `ANY_API`. Possible values are: `ANY_API`, `DATASTORE_MODE_API`, `MONGODB_COMPATIBLE_API`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `density`
- Description: (Optional) The density configuration for this index. Possible values are: `SPARSE_ALL`, `SPARSE_ANY`, `DENSE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multikey`
- Description: (Optional) Optional. Whether the index is multikey. By default, the index is not multikey. For non-multikey indexes, none of the paths in the index definition reach or traverse an array, except via an explicit array index. For multikey indexes, at most one of the paths in the index definition reach or traverse an array, except via an explicit array index. Violations will result in errors. Note this field only applies to indexes with MONGODB_COMPATIBLE_API ApiScope.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_fields"></a>The `fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_path`
- Description: (Optional) Name of the field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `order`
- Description: (Optional) Indicates that this field supports ordering by the specified order or comparing using =, <, <=, >, >=. Only one of `order`, `arrayConfig`, and `vectorConfig` can be specified. Possible values are: `ASCENDING`, `DESCENDING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `array_config`
- Description: (Optional) Indicates that this field supports operations on arrayValues. Only one of `order`, `arrayConfig`, and `vectorConfig` can be specified. Possible values are: `CONTAINS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vector_config`
- Description: (Optional) Indicates that this field supports vector search operations. Only one of `order`, `arrayConfig`, and `vectorConfig` can be specified. Vector Fields should come after the field path `__name__`. Structure is [documented below](#nested_fields_fields_vector_config). <a name="nested_fields_fields_vector_config"></a>The `vector_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dimension`
- Description: (Optional) The resulting index will only include vectors of this dimension, and can be used for vector search with the same dimension.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flat`
- Description: (Optional) Indicates the vector index is a flat index.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
