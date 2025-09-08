## 🛡️ Policy Deployment Engine: `dialogflow_cx_test_case`

This section provides a concise policy evaluation for the `dialogflow_cx_test_case` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_test_case](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_test_case)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the test case, unique within the agent. Limit of 200 characters. | true | None | None |
| `tags` | Tags are short descriptions that users may apply to test cases for organizational and filtering purposes. Each tag should start with "#" and has a limit of 30 characters | false | None | None |
| `notes` | Additional freeform notes about the test case. Limit of 400 characters. | false | None | None |
| `parent` | The agent to create the test case for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |

### test_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tracking_parameters` | Session parameters to be compared when calculating differences. | false | None | None |
| `flow` | Flow name to start the test case with. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. Only one of flow and page should be set to indicate the starting point of the test case. If neither is set, the test case will start with start page on the default start flow. | false | None | None |
| `page` | The page to start the test case with. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>. Only one of flow and page should be set to indicate the starting point of the test case. If neither is set, the test case will start with start page on the default start flow. | false | None | None |

### test_case_conversation_turns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `user_input` | The user input. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input). | false | None | None |
| `virtual_agent_output` | The virtual agent output. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output). | false | None | None |

### user_input Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `input` | User input. Supports text input, event input, dtmf input in the test case. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input). | false | None | None |
| `injected_parameters` | Parameters that need to be injected into the conversation during intent detection. | false | None | None |
| `is_webhook_enabled` | If webhooks should be allowed to trigger in response to the user utterance. Often if parameters are injected, webhooks should not be enabled. | false | None | None |
| `enable_sentiment_analysis` | Whether sentiment analysis is enabled. | false | None | None |

### input Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `language_code` | The language of the input. See [Language Support](https://cloud.google.com/dialogflow/cx/docs/reference/language) for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language. | false | None | None |
| `text` | The natural language text to be processed. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_text). | false | None | None |
| `event` | The event to be triggered. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_event). | false | None | None |
| `dtmf` | The DTMF event to be handled. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_user_input_input_dtmf). | false | None | None |

### text Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `text` | The natural language text to be processed. Text length must not exceed 256 characters. | true | None | None |

### event Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `event` | Name of the event. | true | None | None |

### dtmf Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `digits` | The dtmf digits. | false | None | None |
| `finish_digit` | The finish digit (if any). | false | None | None |

### virtual_agent_output Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `session_parameters` | The session parameters available to the bot at this point. | false | None | None |
| `triggered_intent` | The [Intent](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.intents#Intent) that triggered the response. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_triggered_intent). | false | None | None |
| `current_page` | The [Page](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.flows.pages#Page) on which the utterance was spoken. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_current_page). | false | None | None |
| `text_responses` | The text responses from the agent for the turn. Structure is [documented below](#nested_test_case_conversation_turns_test_case_conversation_turns_virtual_agent_output_text_responses). | false | None | None |

### triggered_intent Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The unique identifier of the intent. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/intents/<Intent ID>. | false | None | None |
| `display_name` | (Output) The human-readable name of the intent, unique within the agent. | none | None | None |

### current_page Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The unique identifier of the page. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>. | false | None | None |
| `display_name` | (Output) The human-readable name of the page, unique within the flow. | none | None | None |

### text_responses Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `text` | A collection of text responses. | false | None | None |
