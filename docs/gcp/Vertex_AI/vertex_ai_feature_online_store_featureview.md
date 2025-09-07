## 🛡️ Policy Deployment Engine: `vertex_ai_feature_online_store_featureview`

This section provides a concise policy evaluation for the `vertex_ai_feature_online_store_featureview` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_online_store_featureview](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_online_store_featureview)

---

## 1. Argument Reference

### `feature_online_store`
- Description: (Required) The name of the FeatureOnlineStore to use for the featureview.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Required) The region for the resource. It should be the same as the featureonlinestore region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the FeatureView. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs to assign to this FeatureView. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_config`
- Description: (Optional) Configures when data is to be synced/updated for this FeatureView. At the end of the sync the latest featureValues for each entityId of this FeatureView are made ready for online serving. Structure is [documented below](#nested_sync_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_source`
- Description: (Optional) Configures how data is supposed to be extracted from a BigQuery source to be loaded onto the FeatureOnlineStore. Structure is [documented below](#nested_big_query_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_registry_source`
- Description: (Optional) Configures the features from a Feature Registry source that need to be loaded onto the FeatureOnlineStore. Structure is [documented below](#nested_feature_registry_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vector_search_config`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Configuration for vector search. It contains the required configurations to create an index from source data, so that approximate nearest neighbor (a.k.a ANN) algorithms search can be performed during online serving. Structure is [documented below](#nested_vector_search_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_sync_config"></a>The `sync_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cron`
- Description: (Optional) Cron schedule (https://en.wikipedia.org/wiki/Cron) to launch scheduled runs. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or "TZ=${IANA_TIME_ZONE}". <a name="nested_big_query_source"></a>The `big_query_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The BigQuery view URI that will be materialized on each sync trigger based on FeatureView.SyncConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entity_id_columns`
- Description: (Required) Columns to construct entityId / row keys. Start by supporting 1 only. <a name="nested_feature_registry_source"></a>The `feature_registry_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_groups`
- Description: (Required) List of features that need to be synced to Online Store. Structure is [documented below](#nested_feature_registry_source_feature_groups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_number`
- Description: (Optional) The project number of the parent project of the feature Groups. <a name="nested_feature_registry_source_feature_groups"></a>The `feature_groups` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_group_id`
- Description: (Required) Identifier of the feature group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_ids`
- Description: (Required) Identifiers of features under the feature group. <a name="nested_vector_search_config"></a>The `vector_search_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `embedding_column`
- Description: (Required) Column of embedding. This column contains the source data to create index for vector search.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_columns`
- Description: (Optional) Columns of features that are used to filter vector search results.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crowding_column`
- Description: (Optional) Column of crowding. This column contains crowding attribute which is a constraint on a neighbor list produced by nearest neighbor search requiring that no more than some value k' of the k neighbors returned have the same value of crowdingAttribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distance_measure_type`
- Description: (Optional) The distance measure used in nearest neighbor search. For details on allowed values, see the [API documentation](https://cloud.google.com/vertex-ai/docs/reference/rest/v1beta1/projects.locations.featureOnlineStores.featureViews#DistanceMeasureType). Possible values are: `SQUARED_L2_DISTANCE`, `COSINE_DISTANCE`, `DOT_PRODUCT_DISTANCE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tree_ah_config`
- Description: (Optional) Configuration options for the tree-AH algorithm (Shallow tree + Asymmetric Hashing). Please refer to this paper for more details: https://arxiv.org/abs/1908.10396 Structure is [documented below](#nested_vector_search_config_tree_ah_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `brute_force_config`
- Description: (Optional) Configuration options for using brute force search, which simply implements the standard linear search in the database for each query. It is primarily meant for benchmarking and to generate the ground truth for approximate search.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `embedding_dimension`
- Description: (Optional) The number of dimensions of the input embedding. <a name="nested_vector_search_config_tree_ah_config"></a>The `tree_ah_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `leaf_node_embedding_count`
- Description: (Optional) Number of embeddings on each leaf node. The default value is 1000 if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
