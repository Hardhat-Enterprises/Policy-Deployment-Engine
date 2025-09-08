## 🛡️ Policy Deployment Engine: `vertex_ai_feature_online_store_featureview`

This section provides a concise policy evaluation for the `vertex_ai_feature_online_store_featureview` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_online_store_featureview](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_online_store_featureview)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `feature_online_store` | The name of the FeatureOnlineStore to use for the featureview. | true | None | None |
| `region` | The region for the resource. It should be the same as the featureonlinestore region. | true | None | None |
| `name` | Name of the FeatureView. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number. | false | None | None |
| `labels` | A set of key/value label pairs to assign to this FeatureView. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### sync_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cron` | Cron schedule (https://en.wikipedia.org/wiki/Cron) to launch scheduled runs. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or "TZ=${IANA_TIME_ZONE}". | false | None | None |

### big_query_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The BigQuery view URI that will be materialized on each sync trigger based on FeatureView.SyncConfig. | true | None | None |
| `entity_id_columns` | Columns to construct entityId / row keys. Start by supporting 1 only. | true | None | None |

### feature_registry_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `feature_groups` | List of features that need to be synced to Online Store. Structure is [documented below](#nested_feature_registry_source_feature_groups). | true | None | None |
| `project_number` | The project number of the parent project of the feature Groups. | false | None | None |

### vector_search_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `embedding_column` | Column of embedding. This column contains the source data to create index for vector search. | true | None | None |
| `filter_columns` | Columns of features that are used to filter vector search results. | false | None | None |
| `crowding_column` | Column of crowding. This column contains crowding attribute which is a constraint on a neighbor list produced by nearest neighbor search requiring that no more than some value k' of the k neighbors returned have the same value of crowdingAttribute. | false | None | None |
| `distance_measure_type` | The distance measure used in nearest neighbor search. For details on allowed values, see the [API documentation](https://cloud.google.com/vertex-ai/docs/reference/rest/v1beta1/projects.locations.featureOnlineStores.featureViews#DistanceMeasureType). Possible values are: `SQUARED_L2_DISTANCE`, `COSINE_DISTANCE`, `DOT_PRODUCT_DISTANCE`. | false | None | None |
| `tree_ah_config` | Configuration options for the tree-AH algorithm (Shallow tree + Asymmetric Hashing). Please refer to this paper for more details: https://arxiv.org/abs/1908.10396 Structure is [documented below](#nested_vector_search_config_tree_ah_config). | false | None | None |
| `brute_force_config` | Configuration options for using brute force search, which simply implements the standard linear search in the database for each query. It is primarily meant for benchmarking and to generate the ground truth for approximate search. | false | None | None |
| `embedding_dimension` | The number of dimensions of the input embedding. | false | None | None |

### feature_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `feature_group_id` | Identifier of the feature group. | true | None | None |
| `feature_ids` | Identifiers of features under the feature group. | true | None | None |

### tree_ah_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `leaf_node_embedding_count` | Number of embeddings on each leaf node. The default value is 1000 if not set. | false | None | None |
