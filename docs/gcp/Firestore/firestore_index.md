## 🛡️ Policy Deployment Engine: `firestore_index`

This section provides a concise policy evaluation for the `firestore_index` resource in GCP.

Reference: [Terraform Registry – firestore_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_index)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `collection` | The collection being indexed. | true | false | None | None | None |
| `fields` | The fields supported by this index. The last non-stored field entry is always for the field path `__name__`. If, on creation, `__name__` was not specified as the last field, it will be added automatically with the same direction as that of the last field defined. If the final field in a composite index is not directional, the `__name__` will be ordered `"ASCENDING"` (unless explicitly specified otherwise). Structure is [documented below](#nested_fields). | true | false | None | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | false | None | None | None |
| `query_scope` | The scope at which a query is run. Default value is `COLLECTION`. Possible values are: `COLLECTION`, `COLLECTION_GROUP`, `COLLECTION_RECURSIVE`. | false | false | None | None | None |
| `api_scope` | The API scope at which a query is run. Default value is `ANY_API`. Possible values are: `ANY_API`, `DATASTORE_MODE_API`, `MONGODB_COMPATIBLE_API`. | false | false | None | None | None |
| `density` | The density configuration for this index. Possible values are: `SPARSE_ALL`, `SPARSE_ANY`, `DENSE`. | false | false | None | None | None |
| `multikey` | Optional. Whether the index is multikey. By default, the index is not multikey. For non-multikey indexes, none of the paths in the index definition reach or traverse an array, except via an explicit array index. For multikey indexes, at most one of the paths in the index definition reach or traverse an array, except via an explicit array index. Violations will result in errors. Note this field only applies to indexes with MONGODB_COMPATIBLE_API ApiScope. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `vector_config` |  | false | false | None | None | None |

### fields Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_path` | Name of the field. | false | false | None | None | None |
| `order` | Indicates that this field supports ordering by the specified order or comparing using =, <, <=, >, >=. Only one of `order`, `arrayConfig`, and `vectorConfig` can be specified. Possible values are: `ASCENDING`, `DESCENDING`. | false | false | None | None | None |
| `array_config` | Indicates that this field supports operations on arrayValues. Only one of `order`, `arrayConfig`, and `vectorConfig` can be specified. Possible values are: `CONTAINS`. | false | false | None | None | None |
| `vector_config` | Indicates that this field supports vector search operations. Only one of `order`, `arrayConfig`, and `vectorConfig` can be specified. Vector Fields should come after the field path `__name__`. Structure is [documented below](#nested_fields_fields_vector_config). | false | false | None | None | None |

### vector_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dimension` | The resulting index will only include vectors of this dimension, and can be used for vector search with the same dimension. | false | false | None | None | None |
| `flat` | Indicates the vector index is a flat index. | false | false | None | None | None |
