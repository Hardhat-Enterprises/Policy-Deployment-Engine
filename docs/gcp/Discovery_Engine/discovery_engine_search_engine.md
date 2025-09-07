## 🛡️ Policy Deployment Engine: `discovery_engine_search_engine`

This section provides a concise policy evaluation for the `discovery_engine_search_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_search_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_search_engine)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Required. The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_ids`
- Description: (Required) The data stores associated with this engine. For SOLUTION_TYPE_SEARCH type of engines, they can only associate with at most one data store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `search_engine_config`
- Description: (Required) Configurations for a Search Engine. Structure is [documented below](#nested_search_engine_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine_id`
- Description: (Required) Unique ID to use for Search Engine App.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collection_id`
- Description: (Required) The collection ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `industry_vertical`
- Description: (Optional) The industry vertical that the engine registers. The restriction of the Engine industry vertical is based on DataStore: If unspecified, default to GENERIC. Vertical on Engine has to match vertical of the DataStore liniked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`, `MEDIA`, `HEALTHCARE_FHIR`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_config`
- Description: (Optional) Common config spec that specifies the metadata of the engine. Structure is [documented below](#nested_common_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_search_engine_config"></a>The `search_engine_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `search_tier`
- Description: (Optional) The search feature tier of this engine. Defaults to SearchTier.SEARCH_TIER_STANDARD if not specified. Default value is `SEARCH_TIER_STANDARD`. Possible values are: `SEARCH_TIER_STANDARD`, `SEARCH_TIER_ENTERPRISE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `search_add_ons`
- Description: (Optional) The add-on that this search engine enables. Each value may be one of: `SEARCH_ADD_ON_LLM`. <a name="nested_common_config"></a>The `common_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `company_name`
- Description: (Optional) The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features.cd
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
