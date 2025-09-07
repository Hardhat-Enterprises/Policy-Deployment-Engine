## 🛡️ Policy Deployment Engine: `dialogflow_cx_generative_settings`

This section provides a concise policy evaluation for the `dialogflow_cx_generative_settings` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_generative_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_generative_settings)

---

## 1. Argument Reference

### `language_code`
- Description: (Required) Language for this settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fallback_settings`
- Description: (Optional) Settings for Generative Fallback. Structure is [documented below](#nested_fallback_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generative_safety_settings`
- Description: (Optional) Settings for Generative Safety. w Structure is [documented below](#nested_generative_safety_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `knowledge_connector_settings`
- Description: (Optional) Settings for knowledge connector. Structure is [documented below](#nested_knowledge_connector_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `llm_model_settings`
- Description: (Optional) LLM model settings. Structure is [documented below](#nested_llm_model_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create a flow for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. <a name="nested_fallback_settings"></a>The `fallback_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_prompt`
- Description: (Optional) Display name of the selected prompt.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prompt_templates`
- Description: (Optional) Stored prompts that can be selected, for example default templates like "conservative" or "chatty", or user defined ones. Structure is [documented below](#nested_fallback_settings_prompt_templates). <a name="nested_fallback_settings_prompt_templates"></a>The `prompt_templates` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Prompt name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prompt_text`
- Description: (Optional) Prompt text that is sent to a LLM on no-match default, placeholders are filled downstream. For example: "Here is a conversation $conversation, a response is: "
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frozen`
- Description: (Optional) If the flag is true, the prompt is frozen and cannot be modified by users. <a name="nested_generative_safety_settings"></a>The `generative_safety_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_banned_phrase_match_strategy`
- Description: (Optional) Optional. Default phrase match strategy for banned phrases. See [PhraseMatchStrategy](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/GenerativeSettings#phrasematchstrategy) for valid values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `banned_phrases`
- Description: (Optional) Banned phrases for generated text. Structure is [documented below](#nested_generative_safety_settings_banned_phrases). <a name="nested_generative_safety_settings_banned_phrases"></a>The `banned_phrases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Required) Text input which can be used for prompt or banned phrases.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language_code`
- Description: (Required) Language code of the phrase. <a name="nested_knowledge_connector_settings"></a>The `knowledge_connector_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `business`
- Description: (Optional) Name of the company, organization or other entity that the agent represents. Used for knowledge connector LLM prompt and for knowledge search.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `agent`
- Description: (Optional) Name of the virtual agent. Used for LLM prompt. Can be left empty.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `agent_identity`
- Description: (Optional) Identity of the agent, e.g. "virtual agent", "AI assistant".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `business_description`
- Description: (Optional) Company description, used for LLM prompt, e.g. "a family company selling freshly roasted coffee beans".``
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `agent_scope`
- Description: (Optional) Agent scope, e.g. "Example company website", "internal Example company website for employees", "manual of car owner".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_data_store_fallback`
- Description: (Optional) Whether to disable fallback to Data Store search results (in case the LLM couldn't pick a proper answer). Per default the feature is enabled. <a name="nested_llm_model_settings"></a>The `llm_model_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `model`
- Description: (Optional) The selected LLM model.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prompt_text`
- Description: (Optional) The custom prompt to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
