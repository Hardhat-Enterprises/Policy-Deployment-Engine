## 🛡️ Policy Deployment Engine: `dialogflow_cx_test_case`

This section provides a concise policy evaluation for the `dialogflow_cx_test_case` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_test_case](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_test_case)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the test case, unique within the agent. Limit of 200 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Tags are short descriptions that users may apply to test cases for organizational and filtering purposes. Each tag should start with "#" and has a limit of 30 characters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notes`
- Description: (Optional) Additional freeform notes about the test case. Limit of 400 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `test_config`
- Description: (Optional) Config for the test case. Structure is [documented below](#nested_test_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `test_case_conversation_turns`
- Description: (Optional) The conversation turns uttered when the test case was created, in chronological order. These include the canonical set of agent utterances that should occur when the agent is working properly. Structure is [documented below](#nested_test_case_conversation_turns).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create the test case for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. <a name="nested_test_config"></a>The `test_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tracking_parameters`
- Description: (Optional) Session parameters to be compared when calculating differences.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flow`
- Description: (Optional) Flow name to start the test case with. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. Only one of flow and page should be set to indicate the starting point of the test case. If neither is set, the test case will start with start page on the default start flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `page`
- Description: (Optional) The page to start the test case with. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>. Only one of flow and page should be set to indicate the starting point of the test case. If neither is set, the test case will start with start page on the default start flow. <a name="nested_test_case_conversation_turns"></a>The `test_case_conversation_turns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_input`
- Description: (Optional) The user input. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_agent_output`
- Description: (Optional) The virtual agent output. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output). <a name="nested_test_case_conversation_turns_test_case_conversation_turns_user_input"></a>The `user_input` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `input`
- Description: (Optional) User input. Supports text input, event input, dtmf input in the test case. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `injected_parameters`
- Description: (Optional) Parameters that need to be injected into the conversation during intent detection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_webhook_enabled`
- Description: (Optional) If webhooks should be allowed to trigger in response to the user utterance. Often if parameters are injected, webhooks should not be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_sentiment_analysis`
- Description: (Optional) Whether sentiment analysis is enabled. <a name="nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input"></a>The `input` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language_code`
- Description: (Optional) The language of the input. See [Language Support](https://cloud.google.com/dialogflow/cx/docs/reference/language) for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The natural language text to be processed. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event`
- Description: (Optional) The event to be triggered. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_event).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dtmf`
- Description: (Optional) The DTMF event to be handled. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_dtmf). <a name="nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_text"></a>The `text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Required) The natural language text to be processed. Text length must not exceed 256 characters. <a name="nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_event"></a>The `event` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event`
- Description: (Required) Name of the event. <a name="nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_dtmf"></a>The `dtmf` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `digits`
- Description: (Optional) The dtmf digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `finish_digit`
- Description: (Optional) The finish digit (if any). <a name="nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output"></a>The `virtual_agent_output` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_parameters`
- Description: (Optional) The session parameters available to the bot at this point.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `triggered_intent`
- Description: (Optional) The [Intent](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.intents#Intent) that triggered the response. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_triggered_intent).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `current_page`
- Description: (Optional) The [Page](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.flows.pages#Page) on which the utterance was spoken. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_current_page).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text_responses`
- Description: (Optional) The text responses from the agent for the turn. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_text_responses). <a name="nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_triggered_intent"></a>The `triggered_intent` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The unique identifier of the intent. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/intents/<Intent ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) The human-readable name of the intent, unique within the agent. <a name="nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_current_page"></a>The `current_page` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The unique identifier of the page. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) The human-readable name of the page, unique within the flow. <a name="nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_text_responses"></a>The `text_responses` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) A collection of text responses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
