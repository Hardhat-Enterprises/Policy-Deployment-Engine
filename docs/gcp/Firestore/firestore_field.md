## 🛡️ Policy Deployment Engine: `firestore_field`

This section provides a concise policy evaluation for the `firestore_field` resource in GCP.

Reference: [Terraform Registry – firestore_field](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_field)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `collection` | The id of the collection group to configure. | true | None | None |
| `field` | The id of the field to configure. | true | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### index_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `indexes` | The indexes to configure on the field. Order or array contains must be specified. Structure is [documented below](#nested_index_config_indexes). | false | None | None |

### ttl_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` | (Output) The state of TTL (time-to-live) configuration for documents that have this Field set. | none | None | None |

### indexes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_scope` | The scope at which a query is run. Collection scoped queries require you specify the collection at query time. Collection group scope allows queries across all collections with the same id. Default value is `COLLECTION`. Possible values are: `COLLECTION`, `COLLECTION_GROUP`. | false | None | None |
| `order` | Indicates that this field supports ordering by the specified order or comparing using =, <, <=, >, >=, !=. Only one of `order` and `arrayConfig` can be specified. Possible values are: `ASCENDING`, `DESCENDING`. | false | None | None |
| `array_config` | Indicates that this field supports operations on arrayValues. Only one of `order` and `arrayConfig` can be specified. Possible values are: `CONTAINS`. | false | None | None |
