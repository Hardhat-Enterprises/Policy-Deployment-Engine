## 🛡️ Policy Deployment Engine: `discovery_engine_chat_engine`

This section provides a concise policy evaluation for the `discovery_engine_chat_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_chat_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_chat_engine)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters. | true | None | None |
| `data_store_ids` | The data stores associated with this engine. Multiple DataStores in the same Collection can be associated here. All listed DataStores must be `SOLUTION_TYPE_CHAT`. | true | None | None |
| `engine_id` | The ID to use for chat engine. | true | None | None |
| `collection_id` | The collection ID. | true | None | None |
| `location` | Location. | true | None | None |
| `industry_vertical` | The industry vertical that the chat engine registers. Vertical on Engine has to match vertical of the DataStore linked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### chat_engine_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `agent_creation_config` | The configuration to generate the Dialogflow agent that is associated to this Engine. Exactly one of `agent_creation_config` or `dialogflow_agent_to_link` must be set. Structure is [documented below](#nested_chat_engine_config_agent_creation_config). | false | None | None |
| `dialogflow_agent_to_link` | The resource name of an existing Dialogflow agent to link to this Chat Engine. Format: `projects/<Project_ID>/locations/<Location_ID>/agents/<Agent_ID>`. Exactly one of `agent_creation_config` or `dialogflow_agent_to_link` must be set. | false | None | None |
| `allow_cross_region` | If the flag set to true, we allow the agent and engine are in different locations, otherwise the agent and engine are required to be in the same location. The flag is set to false by default. Note that the `allow_cross_region` are one-time consumed by and passed to EngineService.CreateEngine. It means they cannot be retrieved using EngineService.GetEngine or EngineService.ListEngines API after engine creation. | false | None | None |

### common_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `company_name` | The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features. | false | None | None |

### agent_creation_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `business` | Name of the company, organization or other entity that the agent represents. Used for knowledge connector LLM prompt and for knowledge search. | false | None | None |
| `default_language_code` | The default language of the agent as a language tag. See [Language Support](https://cloud.google.com/dialogflow/docs/reference/language) for a list of the currently supported language codes. | true | None | None |
| `time_zone` | The time zone of the agent from the [time zone database](https://www.iana.org/time-zones), e.g., America/New_York, Europe/Paris. | true | None | None |
| `location` | Agent location for Agent creation, currently supported values: global/us/eu, it needs to be the same region as the Chat Engine. | false | None | None |
