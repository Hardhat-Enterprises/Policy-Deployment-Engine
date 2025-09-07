## 🛡️ Policy Deployment Engine: `dialogflow_cx_generator`

This section provides a concise policy evaluation for the `dialogflow_cx_generator` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_generator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_generator)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the generator, unique within the agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prompt_text`
- Description: (Required) Prompt for the LLM model. Structure is [documented below](#nested_prompt_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `llm_model_settings`
- Description: (Optional) The LLM model settings. Structure is [documented below](#nested_llm_model_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `model_parameter`
- Description: (Optional) Parameters passed to the LLM to configure its behavior. Structure is [documented below](#nested_model_parameter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `placeholders`
- Description: (Optional) List of custom placeholders in the prompt text. Structure is [documented below](#nested_placeholders).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create a Generator for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language_code`
- Description: (Optional) The language to create generators for the following fields: * Generator.prompt_text.text If not specified, the agent's default language is used. <a name="nested_prompt_text"></a>The `prompt_text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) Text input which can be used for prompt or banned phrases. <a name="nested_llm_model_settings"></a>The `llm_model_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `model`
- Description: (Optional) The selected LLM model.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prompt_text`
- Description: (Optional) The custom prompt to use. <a name="nested_model_parameter"></a>The `model_parameter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temperature`
- Description: (Optional) The temperature used for sampling. Temperature sampling occurs after both topP and topK have been applied. Valid range: [0.0, 1.0] Low temperature = less random. High temperature = more random.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_decode_steps`
- Description: (Optional) The maximum number of tokens to generate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `top_p`
- Description: (Optional) If set, only the tokens comprising the top topP probability mass are considered. If both topP and topK are set, topP will be used for further refining candidates selected with topK. Valid range: (0.0, 1.0]. Small topP = less random. Large topP = more random.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `top_k`
- Description: (Optional) If set, the sampling process in each step is limited to the topK tokens with highest probabilities. Valid range: [1, 40] or 1000+. Small topK = less random. Large topK = more random. <a name="nested_placeholders"></a>The `placeholders` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) Unique ID used to map custom placeholder to parameters in fulfillment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Custom placeholder value in the prompt text.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
