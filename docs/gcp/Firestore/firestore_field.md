## 🛡️ Policy Deployment Engine: `firestore_field`

This section provides a concise policy evaluation for the `firestore_field` resource in GCP.

Reference: [Terraform Registry – firestore_field](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_field)

---

## 1. Argument Reference

### `collection`
- Description: (Required) The id of the collection group to configure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field`
- Description: (Required) The id of the field to configure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Optional) The Firestore database id. Defaults to `"(default)"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `index_config`
- Description: (Optional) The single field index configuration for this field. Creating an index configuration for this field will override any inherited configuration with the indexes specified. Configuring the index configuration with an empty block disables all indexes on the field. Structure is [documented below](#nested_index_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl_config`
- Description: (Optional) The TTL configuration for this Field. If set to an empty block (i.e. `ttl_config {}`), a TTL policy is configured based on the field. If unset, a TTL policy is not configured (or will be disabled upon updating the resource). Structure is [documented below](#nested_ttl_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_index_config"></a>The `index_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `indexes`
- Description: (Optional) The indexes to configure on the field. Order or array contains must be specified. Structure is [documented below](#nested_index_config_indexes). <a name="nested_index_config_indexes"></a>The `indexes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_scope`
- Description: (Optional) The scope at which a query is run. Collection scoped queries require you specify the collection at query time. Collection group scope allows queries across all collections with the same id. Default value is `COLLECTION`. Possible values are: `COLLECTION`, `COLLECTION_GROUP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `order`
- Description: (Optional) Indicates that this field supports ordering by the specified order or comparing using =, <, <=, >, >=, !=. Only one of `order` and `arrayConfig` can be specified. Possible values are: `ASCENDING`, `DESCENDING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `array_config`
- Description: (Optional) Indicates that this field supports operations on arrayValues. Only one of `order` and `arrayConfig` can be specified. Possible values are: `CONTAINS`. <a name="nested_ttl_config"></a>The `ttl_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) The state of TTL (time-to-live) configuration for documents that have this Field set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
