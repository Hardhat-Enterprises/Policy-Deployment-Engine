## 🛡️ Policy Deployment Engine: `vertex_ai_index`

This section provides a concise policy evaluation for the `vertex_ai_index` resource in GCP.

Reference: [Terraform Registry – vertex_ai_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_index)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name of the Index. The name can be up to 128 characters long and can consist of any UTF-8 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the Index.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) An additional information about the Index Structure is [documented below](#nested_metadata).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels with user-defined metadata to organize your Indexes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `index_update_method`
- Description: (Optional) The update method to use with this Index. The value must be the followings. If not set, BATCH_UPDATE will be used by default. * BATCH_UPDATE: user can call indexes.patch with files on Cloud Storage of datapoints to update. * STREAM_UPDATE: user can call indexes.upsertDatapoints/DeleteDatapoints to update the Index and the updates will be applied in corresponding DeployedIndexes in nearly real-time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the index. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_metadata"></a>The `metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `contents_delta_uri`
- Description: (Optional) Allows inserting, updating  or deleting the contents of the Matching Engine Index. The string must be a valid Cloud Storage directory path. If this field is set when calling IndexService.UpdateIndex, then no other Index field can be also updated as part of the same call. The expected structure and format of the files this URI points to is described at https://cloud.google.com/vertex-ai/docs/matching-engine/using-matching-engine#input-data-format
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_complete_overwrite`
- Description: (Optional) If this field is set together with contentsDeltaUri when calling IndexService.UpdateIndex, then existing content of the Index will be replaced by the data from the contentsDeltaUri.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) The configuration of the Matching Engine Index. Structure is [documented below](#nested_metadata_config). <a name="nested_metadata_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dimensions`
- Description: (Required) The number of dimensions of the input vectors.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approximate_neighbors_count`
- Description: (Optional) The default number of neighbors to find via approximate search before exact reordering is performed. Exact reordering is a procedure where results returned by an approximate search algorithm are reordered via a more expensive distance computation. Required if tree-AH algorithm is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shard_size`
- Description: (Optional) Index data is split into equal parts to be processed. These are called "shards". The shard size must be specified when creating an index. The value must be one of the followings: * SHARD_SIZE_SMALL: Small (2GB) * SHARD_SIZE_MEDIUM: Medium (20GB) * SHARD_SIZE_LARGE: Large (50GB)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distance_measure_type`
- Description: (Optional) The distance measure used in nearest neighbor search. The value must be one of the followings: * SQUARED_L2_DISTANCE: Euclidean (L_2) Distance * L1_DISTANCE: Manhattan (L_1) Distance * COSINE_DISTANCE: Cosine Distance. Defined as 1 - cosine similarity. * DOT_PRODUCT_DISTANCE: Dot Product Distance. Defined as a negative of the dot product
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_norm_type`
- Description: (Optional) Type of normalization to be carried out on each vector. The value must be one of the followings: * UNIT_L2_NORM: Unit L2 normalization type * NONE: No normalization type is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `algorithm_config`
- Description: (Optional) The configuration with regard to the algorithms used for efficient search. Structure is [documented below](#nested_metadata_config_algorithm_config). <a name="nested_metadata_config_algorithm_config"></a>The `algorithm_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tree_ah_config`
- Description: (Optional) Configuration options for using the tree-AH algorithm (Shallow tree + Asymmetric Hashing). Please refer to this paper for more details: https://arxiv.org/abs/1908.10396 Structure is [documented below](#nested_metadata_config_algorithm_config_tree_ah_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `brute_force_config`
- Description: (Optional) Configuration options for using brute force search, which simply implements the standard linear search in the database for each query. <a name="nested_metadata_config_algorithm_config_tree_ah_config"></a>The `tree_ah_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `leaf_node_embedding_count`
- Description: (Optional) Number of embeddings on each leaf node. The default value is 1000 if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `leaf_nodes_to_search_percent`
- Description: (Optional) The default percentage of leaf nodes that any query may be searched. Must be in range 1-100, inclusive. The default value is 10 (means 10%) if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
