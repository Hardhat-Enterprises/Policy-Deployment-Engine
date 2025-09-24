## 🛡️ Policy Deployment Engine: `discovery_engine_chat_engine`

This section provides a concise policy evaluation for the `discovery_engine_chat_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_chat_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_chat_engine)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters. | true | false | Just the displayed name | None | None |
| `data_store_ids` | The data stores associated with this engine. Multiple DataStores in the same Collection can be associated here. All listed DataStores must be `SOLUTION_TYPE_CHAT`. | true | false | Where the chat engine gets its data | None | None |
| `chat_engine_config` | Configurations for a chat Engine. Structure is [documented below](#nested_chat_engine_config). | true | true | The internal configurations of this block can change, though some are security related | None | None |
| `engine_id` | The ID to use for chat engine. | true | false | the ID is just the ID | None | None |
| `collection_id` | The collection ID. | true | false | the ID is just the ID | None | None |
| `location` | Location. | true | true | Data residency laws exist, eu has strongest avaliable for the service. | eu | us |
| `industry_vertical` | The industry vertical that the chat engine registers. Vertical on Engine has to match vertical of the DataStore linked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`. | false | false | generic is the only option | None | None |
| `common_config` | Common config spec that specifies the metadata of the engine. Structure is [documented below](#nested_common_config). | false | false | Basic additional support for LLM that is optional and not that important | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Is just the project ID | None | None |
| `agent_creation_config` |  | false | false | This happens in the backgroud | None | None |

### chat_engine_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `agent_creation_config` | The configuration to generate the Dialogflow agent that is associated to this Engine. Exactly one of `agent_creation_config` or `dialogflow_agent_to_link` must be set. Structure is [documented below](#nested_chat_engine_config_agent_creation_config). | false | true | linking to other agents can be a risk | False | True |
| `dialogflow_agent_to_link` | The resource name of an existing Dialogflow agent to link to this Chat Engine. Format: `projects/<Project_ID>/locations/<Location_ID>/agents/<Agent_ID>`. Exactly one of `agent_creation_config` or `dialogflow_agent_to_link` must be set. | false | false | None | None | None |
| `allow_cross_region` | If the flag set to true, we allow the agent and engine are in different locations, otherwise the agent and engine are required to be in the same location. The flag is set to false by default. Note that the `allow_cross_region` are one-time consumed by and passed to EngineService.CreateEngine. It means they cannot be retrieved using EngineService.GetEngine or EngineService.ListEngines API after engine creation. | false | true | data residency laws | false | true |

### common_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `company_name` | The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features. | false | false | None | None | None |

### agent_creation_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `business` | Name of the company, organization or other entity that the agent represents. Used for knowledge connector LLM prompt and for knowledge search. | false | false | None | None | None |
| `default_language_code` | The default language of the agent as a language tag. See [Language Support](https://cloud.google.com/dialogflow/docs/reference/language) for a list of the currently supported language codes. | true | false | None | None | None |
| `time_zone` | The time zone of the agent from the [time zone database](https://www.iana.org/time-zones), e.g., America/New_York, Europe/Paris. | true | false | None | None | None |
| `location` | Agent location for Agent creation, currently supported values: global/us/eu, it needs to be the same region as the Chat Engine. | false | false | None | None | None |
