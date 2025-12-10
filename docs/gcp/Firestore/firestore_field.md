## 🛡️ Policy Deployment Engine: `firestore_field`

This section provides a concise policy evaluation for the `firestore_field` resource in GCP.

Reference: [Terraform Registry – firestore_field](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_field)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `collection` | The id of the collection group to configure. | true | false | None | None | None |
| `field` | The id of the field to configure. | true | false | None | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | false | None | None | None |
| `index_config` | The single field index configuration for this field. Creating an index configuration for this field will override any inherited configuration with the indexes specified. Configuring the index configuration with an empty block disables all indexes on the field. Structure is [documented below](#nested_index_config). | false | false | None | None | None |
| `ttl_config` | The TTL configuration for this Field. If set to an empty block (i.e. `ttl_config {}`), a TTL policy is configured based on the field. If unset, a TTL policy is not configured (or will be disabled upon updating the resource). Structure is [documented below](#nested_ttl_config). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `indexes` |  | false | false | None | None | None |

### index_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `indexes` | The indexes to configure on the field. Order or array contains must be specified. Structure is [documented below](#nested_index_config_indexes). | false | false | None | None | None |

### ttl_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `state` | (Output) The state of TTL (time-to-live) configuration for documents that have this Field set. | false | false | None | None | None |

### indexes Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query_scope` | The scope at which a query is run. Collection scoped queries require you specify the collection at query time. Collection group scope allows queries across all collections with the same id. Default value is `COLLECTION`. Possible values are: `COLLECTION`, `COLLECTION_GROUP`. | false | false | None | None | None |
| `order` | Indicates that this field supports ordering by the specified order or comparing using =, <, <=, >, >=, !=. Only one of `order` and `arrayConfig` can be specified. Possible values are: `ASCENDING`, `DESCENDING`. | false | false | None | None | None |
| `array_config` | Indicates that this field supports operations on arrayValues. Only one of `order` and `arrayConfig` can be specified. Possible values are: `CONTAINS`. | false | false | None | None | None |
