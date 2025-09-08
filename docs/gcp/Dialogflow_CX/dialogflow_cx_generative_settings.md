## 🛡️ Policy Deployment Engine: `dialogflow_cx_generative_settings`

This section provides a concise policy evaluation for the `dialogflow_cx_generative_settings` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_generative_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_generative_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `language_code` | Language for this settings. | true | None | None |
| `parent` | The agent to create a flow for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |

### fallback_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `selected_prompt` | Display name of the selected prompt. | false | None | None |
| `prompt_templates` | Stored prompts that can be selected, for example default templates like "conservative" or "chatty", or user defined ones. Structure is [documented below](#nested_fallback_settings_prompt_templates). | false | None | None |

### generative_safety_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default_banned_phrase_match_strategy` | Optional. Default phrase match strategy for banned phrases. See [PhraseMatchStrategy](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/GenerativeSettings#phrasematchstrategy) for valid values. | false | None | None |
| `banned_phrases` | Banned phrases for generated text. Structure is [documented below](#nested_generative_safety_settings_banned_phrases). | false | None | None |

### knowledge_connector_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `business` | Name of the company, organization or other entity that the agent represents. Used for knowledge connector LLM prompt and for knowledge search. | false | None | None |
| `agent` | Name of the virtual agent. Used for LLM prompt. Can be left empty. | false | None | None |
| `agent_identity` | Identity of the agent, e.g. "virtual agent", "AI assistant". | false | None | None |
| `business_description` | Company description, used for LLM prompt, e.g. "a family company selling freshly roasted coffee beans".`` | false | None | None |
| `agent_scope` | Agent scope, e.g. "Example company website", "internal Example company website for employees", "manual of car owner". | false | None | None |
| `disable_data_store_fallback` | Whether to disable fallback to Data Store search results (in case the LLM couldn't pick a proper answer). Per default the feature is enabled. | false | None | None |

### llm_model_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `model` | The selected LLM model. | false | None | None |
| `prompt_text` | The custom prompt to use. | false | None | None |

### prompt_templates Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Prompt name. | false | None | None |
| `prompt_text` | Prompt text that is sent to a LLM on no-match default, placeholders are filled downstream. For example: "Here is a conversation $conversation, a response is: " | false | None | None |
| `frozen` | If the flag is true, the prompt is frozen and cannot be modified by users. | false | None | None |

### banned_phrases Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `text` | Text input which can be used for prompt or banned phrases. | true | None | None |
| `language_code` | Language code of the phrase. | true | None | None |
