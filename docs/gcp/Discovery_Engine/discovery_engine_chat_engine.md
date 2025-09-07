## 🛡️ Policy Deployment Engine: `discovery_engine_chat_engine`

This section provides a concise policy evaluation for the `discovery_engine_chat_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_chat_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_chat_engine)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_ids`
- Description: (Required) The data stores associated with this engine. Multiple DataStores in the same Collection can be associated here. All listed DataStores must be `SOLUTION_TYPE_CHAT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `chat_engine_config`
- Description: (Required) Configurations for a chat Engine. Structure is [documented below](#nested_chat_engine_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine_id`
- Description: (Required) The ID to use for chat engine.
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
- Description: (Optional) The industry vertical that the chat engine registers. Vertical on Engine has to match vertical of the DataStore linked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_config`
- Description: (Optional) Common config spec that specifies the metadata of the engine. Structure is [documented below](#nested_common_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_chat_engine_config"></a>The `chat_engine_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `agent_creation_config`
- Description: (Optional) The configuration to generate the Dialogflow agent that is associated to this Engine. Exactly one of `agent_creation_config` or `dialogflow_agent_to_link` must be set. Structure is [documented below](#nested_chat_engine_config_agent_creation_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dialogflow_agent_to_link`
- Description: (Optional) The resource name of an existing Dialogflow agent to link to this Chat Engine. Format: `projects/<Project_ID>/locations/<Location_ID>/agents/<Agent_ID>`. Exactly one of `agent_creation_config` or `dialogflow_agent_to_link` must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_cross_region`
- Description: (Optional) If the flag set to true, we allow the agent and engine are in different locations, otherwise the agent and engine are required to be in the same location. The flag is set to false by default. Note that the `allow_cross_region` are one-time consumed by and passed to EngineService.CreateEngine. It means they cannot be retrieved using EngineService.GetEngine or EngineService.ListEngines API after engine creation. <a name="nested_chat_engine_config_agent_creation_config"></a>The `agent_creation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `business`
- Description: (Optional) Name of the company, organization or other entity that the agent represents. Used for knowledge connector LLM prompt and for knowledge search.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_language_code`
- Description: (Required) The default language of the agent as a language tag. See [Language Support](https://cloud.google.com/dialogflow/docs/reference/language) for a list of the currently supported language codes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) The time zone of the agent from the [time zone database](https://www.iana.org/time-zones), e.g., America/New_York, Europe/Paris.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Agent location for Agent creation, currently supported values: global/us/eu, it needs to be the same region as the Chat Engine. <a name="nested_common_config"></a>The `common_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `company_name`
- Description: (Optional) The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
