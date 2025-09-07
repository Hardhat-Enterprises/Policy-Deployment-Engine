## 🛡️ Policy Deployment Engine: `discovery_engine_recommendation_engine`

This section provides a concise policy evaluation for the `discovery_engine_recommendation_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_recommendation_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_recommendation_engine)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Required. The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_ids`
- Description: (Required) The data stores associated with this engine. For SOLUTION_TYPE_RECOMMENDATION type of engines, they can only associate with at most one data store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine_id`
- Description: (Required) Unique ID to use for Recommendation Engine.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `industry_vertical`
- Description: (Optional) The industry vertical that the engine registers. The restriction of the Engine industry vertical is based on DataStore: If unspecified, default to GENERIC. Vertical on Engine has to match vertical of the DataStore liniked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`, `MEDIA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `media_recommendation_engine_config`
- Description: (Optional) Configurations for a Media Recommendation Engine. Only applicable on the data stores with SOLUTION_TYPE_RECOMMENDATION solution type and MEDIA industry vertical. Structure is [documented below](#nested_media_recommendation_engine_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_config`
- Description: (Optional) Common config spec that specifies the metadata of the engine. Structure is [documented below](#nested_common_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_media_recommendation_engine_config"></a>The `media_recommendation_engine_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of engine. e.g., `recommended-for-you`. This field together with MediaRecommendationEngineConfig.optimizationObjective describes engine metadata to use to control engine training and serving. Currently supported values: `recommended-for-you`, `others-you-may-like`, `more-like-this`, `most-popular-items`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optimization_objective`
- Description: (Optional) The optimization objective. e.g., `cvr`. This field together with MediaRecommendationEngineConfig.type describes engine metadata to use to control engine training and serving. Currently supported values: `ctr`, `cvr`. If not specified, we choose default based on engine type. Default depends on type of recommendation: `recommended-for-you` => `ctr` `others-you-may-like` => `ctr`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optimization_objective_config`
- Description: (Optional) Name and value of the custom threshold for cvr optimization_objective. For target_field `watch-time`, target_field_value must be an integer value indicating the media progress time in seconds between (0, 86400] (excludes 0, includes 86400) (e.g., 90). For target_field `watch-percentage`, the target_field_value must be a valid float value between (0, 1.0] (excludes 0, includes 1.0) (e.g., 0.5). Structure is [documented below](#nested_media_recommendation_engine_config_optimization_objective_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `training_state`
- Description: (Optional) The training state that the engine is in (e.g. `TRAINING` or `PAUSED`). Since part of the cost of running the service is frequency of training - this can be used to determine when to train engine in order to control cost. If not specified: the default value for `CreateEngine` method is `TRAINING`. The default value for `UpdateEngine` method is to keep the state the same as before. Possible values are: `PAUSED`, `TRAINING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine_features_config`
- Description: (Optional) More feature configs of the selected engine type. Structure is [documented below](#nested_media_recommendation_engine_config_engine_features_config). <a name="nested_media_recommendation_engine_config_optimization_objective_config"></a>The `optimization_objective_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_field`
- Description: (Optional) The name of the field to target. Currently supported values: `watch-percentage`, `watch-time`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_field_value_float`
- Description: (Optional) The threshold to be applied to the target (e.g., 0.5). <a name="nested_media_recommendation_engine_config_engine_features_config"></a>The `engine_features_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recommended_for_you_config`
- Description: (Optional) Additional feature configurations for creating a `recommended-for-you` engine. Structure is [documented below](#nested_media_recommendation_engine_config_engine_features_config_recommended_for_you_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `most_popular_config`
- Description: (Optional) Feature configurations that are required for creating a Most Popular engine. Structure is [documented below](#nested_media_recommendation_engine_config_engine_features_config_most_popular_config). <a name="nested_media_recommendation_engine_config_engine_features_config_recommended_for_you_config"></a>The `recommended_for_you_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `context_event_type`
- Description: (Optional) The type of event with which the engine is queried at prediction time. If set to `generic`, only `view-item`, `media-play`,and `media-complete` will be used as `context-event` in engine training. If set to `view-home-page`, `view-home-page` will also be used as `context-events` in addition to `view-item`, `media-play`, and `media-complete`. Currently supported for the `recommended-for-you` engine. Currently supported values: `view-home-page`, `generic`. <a name="nested_media_recommendation_engine_config_engine_features_config_most_popular_config"></a>The `most_popular_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_window_days`
- Description: (Optional) The time window of which the engine is queried at training and prediction time. Positive integers only. The value translates to the last X days of events. Currently required for the `most-popular-items` engine. <a name="nested_common_config"></a>The `common_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `company_name`
- Description: (Optional) The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features.cd
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
