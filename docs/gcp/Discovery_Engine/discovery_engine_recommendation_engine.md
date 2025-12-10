## 🛡️ Policy Deployment Engine: `discovery_engine_recommendation_engine`

This section provides a concise policy evaluation for the `discovery_engine_recommendation_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_recommendation_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_recommendation_engine)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Required. The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters. | true | false | naming | None | None |
| `data_store_ids` | The data stores associated with this engine. For SOLUTION_TYPE_RECOMMENDATION type of engines, they can only associate with at most one data store. | true | false | IDs | None | None |
| `engine_id` | Unique ID to use for Recommendation Engine. | true | false | IDs | None | None |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | Laws apply based on location | eu | us |
| `industry_vertical` | The industry vertical that the engine registers. The restriction of the Engine industry vertical is based on DataStore: If unspecified, default to GENERIC. Vertical on Engine has to match vertical of the DataStore liniked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`, `MEDIA`. | false | false | None | None | None |
| `media_recommendation_engine_config` | Configurations for a Media Recommendation Engine. Only applicable on the data stores with SOLUTION_TYPE_RECOMMENDATION solution type and MEDIA industry vertical. Structure is [documented below](#nested_media_recommendation_engine_config). | false | false | None | None | None |
| `common_config` | Common config spec that specifies the metadata of the engine. Structure is [documented below](#nested_common_config). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `optimization_objective_config` |  | false | false | None | None | None |
| `engine_features_config` |  | false | false | None | None | None |
| `recommended_for_you_config` |  | false | false | None | None | None |
| `most_popular_config` |  | false | false | None | None | None |

### media_recommendation_engine_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The type of engine. e.g., `recommended-for-you`. This field together with MediaRecommendationEngineConfig.optimizationObjective describes engine metadata to use to control engine training and serving. Currently supported values: `recommended-for-you`, `others-you-may-like`, `more-like-this`, `most-popular-items`. | false | false | None | None | None |
| `optimization_objective` | The optimization objective. e.g., `cvr`. This field together with MediaRecommendationEngineConfig.type describes engine metadata to use to control engine training and serving. Currently supported values: `ctr`, `cvr`. If not specified, we choose default based on engine type. Default depends on type of recommendation: `recommended-for-you` => `ctr` `others-you-may-like` => `ctr` | false | false | None | None | None |
| `optimization_objective_config` | Name and value of the custom threshold for cvr optimization_objective. For target_field `watch-time`, target_field_value must be an integer value indicating the media progress time in seconds between (0, 86400] (excludes 0, includes 86400) (e.g., 90). For target_field `watch-percentage`, the target_field_value must be a valid float value between (0, 1.0] (excludes 0, includes 1.0) (e.g., 0.5). Structure is [documented below](#nested_media_recommendation_engine_config_optimization_objective_config). | false | false | None | None | None |
| `training_state` | The training state that the engine is in (e.g. `TRAINING` or `PAUSED`). Since part of the cost of running the service is frequency of training - this can be used to determine when to train engine in order to control cost. If not specified: the default value for `CreateEngine` method is `TRAINING`. The default value for `UpdateEngine` method is to keep the state the same as before. Possible values are: `PAUSED`, `TRAINING`. | false | false | None | None | None |
| `engine_features_config` | More feature configs of the selected engine type. Structure is [documented below](#nested_media_recommendation_engine_config_engine_features_config). | false | false | None | None | None |

### common_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `company_name` | The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features.cd | false | false | None | None | None |

### optimization_objective_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_field` | The name of the field to target. Currently supported values: `watch-percentage`, `watch-time`. | false | false | None | None | None |
| `target_field_value_float` | The threshold to be applied to the target (e.g., 0.5). | false | false | None | None | None |

### engine_features_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `recommended_for_you_config` | Additional feature configurations for creating a `recommended-for-you` engine. Structure is [documented below](#nested_media_recommendation_engine_config_engine_features_config_recommended_for_you_config). | false | false | None | None | None |
| `most_popular_config` | Feature configurations that are required for creating a Most Popular engine. Structure is [documented below](#nested_media_recommendation_engine_config_engine_features_config_most_popular_config). | false | false | None | None | None |

### recommended_for_you_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `context_event_type` | The type of event with which the engine is queried at prediction time. If set to `generic`, only `view-item`, `media-play`,and `media-complete` will be used as `context-event` in engine training. If set to `view-home-page`, `view-home-page` will also be used as `context-events` in addition to `view-item`, `media-play`, and `media-complete`. Currently supported for the `recommended-for-you` engine. Currently supported values: `view-home-page`, `generic`. | false | false | None | None | None |

### most_popular_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `time_window_days` | The time window of which the engine is queried at training and prediction time. Positive integers only. The value translates to the last X days of events. Currently required for the `most-popular-items` engine. | false | false | None | None | None |
