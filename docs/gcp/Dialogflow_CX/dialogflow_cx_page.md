## 🛡️ Policy Deployment Engine: `dialogflow_cx_page`

This section provides a concise policy evaluation for the `dialogflow_cx_page` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_page](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_page)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the page, unique within the agent. | true | None | None |
| `transition_route_groups` | Ordered list of TransitionRouteGroups associated with the page. Transition route groups must be unique within a page. If multiple transition routes within a page scope refer to the same intent, then the precedence order is: page's transition route -> page's transition route group -> flow's transition routes. If multiple transition route groups within a page contain the same intent, then the first group in the ordered list takes precedence. Format:projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/transitionRouteGroups/<TransitionRouteGroup ID>. | false | None | None |
| `parent` | The flow to create a page for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. | false | None | None |
| `language_code` | The language of the following fields in page: Page.entry_fulfillment.messages Page.entry_fulfillment.conditional_cases Page.event_handlers.trigger_fulfillment.messages Page.event_handlers.trigger_fulfillment.conditional_cases Page.form.parameters.fill_behavior.initial_prompt_fulfillment.messages Page.form.parameters.fill_behavior.initial_prompt_fulfillment.conditional_cases Page.form.parameters.fill_behavior.reprompt_event_handlers.messages Page.form.parameters.fill_behavior.reprompt_event_handlers.conditional_cases Page.transition_routes.trigger_fulfillment.messages Page.transition_routes.trigger_fulfillment.conditional_cases If not specified, the agent's default language is used. Many languages are supported. Note: languages must be enabled in the agent before they can be used. | false | None | None |

### entry_fulfillment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `messages` | The list of rich message responses to present to the user. Structure is [documented below](#nested_entry_fulfillment_messages). | false | None | None |
| `webhook` | The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>. | false | None | None |
| `return_partial_responses` | Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks. | false | None | None |
| `tag` | The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified. | false | None | None |
| `set_parameter_actions` | Set parameter values before executing the webhook. Structure is [documented below](#nested_entry_fulfillment_set_parameter_actions). | false | None | None |
| `conditional_cases` | Conditional cases for this fulfillment. Structure is [documented below](#nested_entry_fulfillment_conditional_cases). | false | None | None |

### form Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parameters` | Parameters to collect from the user. Structure is [documented below](#nested_form_parameters). | false | None | None |

### transition_routes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | (Output) The unique identifier of this transition route. | none | None | None |
| `intent` | The unique identifier of an Intent. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/intents/<Intent ID>. Indicates that the transition can only happen when the given intent is matched. At least one of intent or condition must be specified. When both intent and condition are specified, the transition can only happen when both are fulfilled. | false | None | None |
| `condition` | The condition to evaluate against form parameters or session parameters. At least one of intent or condition must be specified. When both intent and condition are specified, the transition can only happen when both are fulfilled. | false | None | None |
| `trigger_fulfillment` | The fulfillment to call when the condition is satisfied. At least one of triggerFulfillment and target must be specified. When both are defined, triggerFulfillment is executed first. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment). | false | None | None |
| `target_page` | The target page to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>. | false | None | None |
| `target_flow` | The target flow to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. | false | None | None |

### event_handlers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | (Output) The unique identifier of this event handler. | none | None | None |
| `event` | The name of the event to handle. | false | None | None |
| `trigger_fulfillment` | The fulfillment to call when the event occurs. Handling webhook errors with a fulfillment enabled with webhook could cause infinite loop. It is invalid to specify such fulfillment for a handler handling webhooks. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment). | false | None | None |
| `target_page` | The target page to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>. | false | None | None |
| `target_flow` | The target flow to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. | false | None | None |

### advanced_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dtmf_settings` | Define behaviors for DTMF (dual tone multi frequency). DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_dtmf_settings). | false | None | None |
| `speech_settings` | Settings for speech to text detection. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_speech_settings). | false | None | None |
| `logging_settings` | Settings for logging. Settings for Dialogflow History, Contact Center messages, StackDriver logs, and speech logging. Exposed at the following levels: * Agent level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_logging_settings). | false | None | None |

### knowledge_connector_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether Knowledge Connector is enabled or not. | false | None | None |
| `trigger_fulfillment` | The fulfillment to be triggered. When the answers from the Knowledge Connector are selected by Dialogflow, you can utitlize the request scoped parameter $request.knowledge.answers (contains up to the 5 highest confidence answers) and $request.knowledge.questions (contains the corresponding questions) to construct the fulfillment. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment). | false | None | None |
| `data_store_connections` | Optional. List of related data store connections. Structure is [documented below](#nested_knowledge_connector_settings_data_store_connections). | false | None | None |
| `target_page` | The target page to transition to. Format: projects/<ProjectID>/locations/<LocationID>/agents/<AgentID>/flows/<FlowID>/pages/<PageID>. The page must be in the same host flow (the flow that owns this `KnowledgeConnectorSettings`). This field is part of a union field `target`: Only one of `targetPage` or `targetFlow` may be set. | false | None | None |
| `target_flow` | The target flow to transition to. Format: projects/<ProjectID>/locations/<LocationID>/agents/<AgentID>/flows/<FlowID>. This field is part of a union field `target`: Only one of `targetPage` or `targetFlow` may be set. | false | None | None |

### messages Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `channel` | The channel which the response is associated with. Clients can specify the channel via QueryParameters.channel, and only associated channel response will be returned. | false | None | None |
| `text` | The text response message. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_text). | false | None | None |
| `payload` | Returns a response containing a custom, platform-specific payload. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. | false | None | None |
| `conversation_success` | Indicates that the conversation succeeded, i.e., the bot handled the issue that the customer talked to it about. Dialogflow only uses this to determine which conversations should be counted as successful and doesn't process the metadata in this message in any way. Note that Dialogflow also considers conversations that get to the conversation end page as successful even if they don't return ConversationSuccess. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates that the conversation succeeded. * In a webhook response when you determine that you handled the customer issue. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_conversation_success). | false | None | None |
| `output_audio_text` | A text or ssml response that is preferentially used for TTS output audio synthesis, as described in the comment on the ResponseMessage message. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_output_audio_text). | false | None | None |
| `live_agent_handoff` | Indicates that the conversation should be handed off to a live agent. Dialogflow only uses this to determine which conversations were handed off to a human agent for measurement purposes. What else to do with this signal is up to you and your handoff procedures. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates something went extremely wrong in the conversation. * In a webhook response when you determine that the customer issue can only be handled by a human. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_live_agent_handoff). | false | None | None |
| `play_audio` | Specifies an audio clip to be played by the client as part of the response. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_play_audio). | false | None | None |
| `telephony_transfer_call` | Represents the signal that telles the client to transfer the phone call connected to the agent to a third-party endpoint. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_telephony_transfer_call). | false | None | None |
| `end_interaction` | (Output) This type has no fields. Indicates that interaction with the Dialogflow agent has ended. This message is generated by Dialogflow only and not supposed to be defined by the user. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. | none | None | None |
| `mixed_audio` | (Output) Represents an audio message that is composed of both segments synthesized from the Dialogflow agent prompts and ones hosted externally at the specified URIs. The external URIs are specified via playAudio. This message is generated by Dialogflow only and not supposed to be defined by the user. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_mixed_audio). | none | None | None |
| `knowledge_info_card` | This type has no fields. Represents info card response. If the response contains generative knowledge prediction, Dialogflow will return a payload with Infobot Messenger compatible info card. Otherwise, the info card response is skipped. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. | false | None | None |

### text Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `text` | A collection of text response variants. If multiple variants are defined, only one text response variant is returned at runtime. required: true | false | None | None |
| `allow_playback_interruption` | (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. | none | None | None |

### conversation_success Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata` | Custom metadata. Dialogflow doesn't impose any structure on this. | false | None | None |

### output_audio_text Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_playback_interruption` | (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. | none | None | None |
| `text` | The raw text to be synthesized. This field is part of a union field `source`: Only one of `text` or `ssml` may be set. | false | None | None |
| `ssml` | The SSML text to be synthesized. For more information, see SSML. This field is part of a union field `source`: Only one of `text` or `ssml` may be set. | false | None | None |

### live_agent_handoff Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata` | Custom metadata. Dialogflow doesn't impose any structure on this. | false | None | None |

### play_audio Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `audio_uri` | URI of the audio clip. Dialogflow does not impose any validation on this value. It is specific to the client that reads it. | true | None | None |
| `allow_playback_interruption` | (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. The `mixed_audio` block contains: | none | None | None |
| `segments` | Segments this audio response is composed of. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_mixed_audio_segments). | false | None | None |

### telephony_transfer_call Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `phone_number` | Transfer the call to a phone number in E.164 format. | true | None | None |

### set_parameter_actions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parameter` | Display name of the parameter. | false | None | None |
| `value` | The new JSON-encoded value of the parameter. A null value clears the parameter. | false | None | None |

### conditional_cases Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cases` | A JSON encoded list of cascading if-else conditions. Cases are mutually exclusive. The first one with a matching condition is selected, all the rest ignored. See [Case](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/Fulfillment#case) for the schema. | false | None | None |

### parameters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the parameter, unique within the form. | false | None | None |
| `required` | Indicates whether the parameter is required. Optional parameters will not trigger prompts; however, they are filled if the user specifies them. Required parameters must be filled before form filling concludes. | false | None | None |
| `entity_type` | The entity type of the parameter. Format: projects/-/locations/-/agents/-/entityTypes/<System Entity Type ID> for system entity types (for example, projects/-/locations/-/agents/-/entityTypes/sys.date), or projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/entityTypes/<Entity Type ID> for developer entity types. | false | None | None |
| `is_list` | Indicates whether the parameter represents a list of values. | false | None | None |
| `fill_behavior` | Defines fill behavior for the parameter. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior). | false | None | None |
| `default_value` | The default value of an optional parameter. If the parameter is required, the default value will be ignored. | false | None | None |
| `redact` | Indicates whether the parameter content should be redacted in log. If redaction is enabled, the parameter content will be replaced by parameter name during logging. Note: the parameter content is subject to redaction if either parameter level redaction or entity type level redaction is enabled. | false | None | None |
| `advanced_settings` | Hierarchical advanced settings for this parameter. The settings exposed at the lower level overrides the settings exposed at the higher level. Hierarchy: Agent->Flow->Page->Fulfillment/Parameter. Structure is [documented below](#nested_form_parameters_parameters_advanced_settings). | false | None | None |

### fill_behavior Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `initial_prompt_fulfillment` | The fulfillment to provide the initial prompt that the agent can present to the user in order to fill the parameter. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior_initial_prompt_fulfillment). | false | None | None |
| `reprompt_event_handlers` | The handlers for parameter-level events, used to provide reprompt for the parameter or transition to a different page/flow. The supported events are: * sys.no-match-<N>, where N can be from 1 to 6 * sys.no-match-default * sys.no-input-<N>, where N can be from 1 to 6 * sys.no-input-default * sys.invalid-parameter [initialPromptFulfillment][initialPromptFulfillment] provides the first prompt for the parameter. If the user's response does not fill the parameter, a no-match/no-input event will be triggered, and the fulfillment associated with the sys.no-match-1/sys.no-input-1 handler (if defined) will be called to provide a prompt. The sys.no-match-2/sys.no-input-2 handler (if defined) will respond to the next no-match/no-input event, and so on. A sys.no-match-default or sys.no-input-default handler will be used to handle all following no-match/no-input events after all numbered no-match/no-input handlers for the parameter are consumed. A sys.invalid-parameter handler can be defined to handle the case where the parameter values have been invalidated by webhook. For example, if the user's response fill the parameter, however the parameter was invalidated by webhook, the fulfillment associated with the sys.invalid-parameter handler (if defined) will be called to provide a prompt. If the event handler for the corresponding event can't be found on the parameter, initialPromptFulfillment will be re-prompted. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior_reprompt_event_handlers). | false | None | None |

### initial_prompt_fulfillment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `messages` | The list of rich message responses to present to the user. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior_initial_prompt_fulfillment_messages). | false | None | None |
| `webhook` | The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>. | false | None | None |
| `return_partial_responses` | Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks. | false | None | None |
| `tag` | The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified. | false | None | None |
| `set_parameter_actions` | Set parameter values before executing the webhook. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior_initial_prompt_fulfillment_set_parameter_actions). | false | None | None |
| `conditional_cases` | Conditional cases for this fulfillment. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior_initial_prompt_fulfillment_conditional_cases). | false | None | None |

### reprompt_event_handlers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | (Output) The unique identifier of this event handler. | none | None | None |
| `event` | The name of the event to handle. | false | None | None |
| `trigger_fulfillment` | The fulfillment to call when the event occurs. Handling webhook errors with a fulfillment enabled with webhook could cause infinite loop. It is invalid to specify such fulfillment for a handler handling webhooks. Structure is [documented below](#nested_form_parameters_parameters_fill_behavior_reprompt_event_handlers_reprompt_event_handlers_trigger_fulfillment). | false | None | None |
| `target_page` | The target page to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>. | false | None | None |
| `target_flow` | The target flow to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. | false | None | None |

### trigger_fulfillment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `messages` | The list of rich message responses to present to the user. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages). | false | None | None |
| `webhook` | The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>. | false | None | None |
| `return_partial_responses` | Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks. | false | None | None |
| `tag` | The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified. | false | None | None |
| `set_parameter_actions` | Set parameter values before executing the webhook. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_set_parameter_actions). | false | None | None |
| `conditional_cases` | Conditional cases for this fulfillment. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_conditional_cases). | false | None | None |
| `advanced_settings` | Hierarchical advanced settings for agent/flow/page/fulfillment/parameter. Settings exposed at lower level overrides the settings exposed at higher level. Overriding occurs at the sub-setting level. For example, the playbackInterruptionSettings at fulfillment level only overrides the playbackInterruptionSettings at the agent level, leaving other settings at the agent level unchanged. DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Hierarchy: Agent->Flow->Page->Fulfillment/Parameter. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings). | false | None | None |
| `enable_generative_fallback` | If the flag is true, the agent will utilize LLM to generate a text response. If LLM generation fails, the defined responses in the fulfillment will be respected. This flag is only useful for fulfillments associated with no-match event handlers. | false | None | None |

### dtmf_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | If true, incoming audio is processed for DTMF (dual tone multi frequtectency) events. For example, if the caller presses a button on their telephone keypad and DTMF processing is enabled, Dialogflow will de the event (e.g. a "3" was pressed) in the incoming audio and pass the event to the bot to drive business logic (e.g. when 3 is pressed, return the account balance). | false | None | None |
| `max_digits` | Max length of DTMF digits. | false | None | None |
| `finish_digit` | The digit that terminates a DTMF digit sequence. | false | None | None |
| `interdigit_timeout_duration` | Interdigit timeout setting for matching dtmf input to regex. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". | false | None | None |
| `endpointing_timeout_duration` | Endpoint timeout setting for matching dtmf input to regex. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". | false | None | None |

### segments Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_playback_interruption` | (Output) Whether the playback of this segment can be interrupted by the end user's speech and the client should then start the next Dialogflow request. | none | None | None |
| `audio` | Raw audio synthesized from the Dialogflow agent's response using the output config specified in the request. A base64-encoded string. This field is part of a union field `content`: Only one of `audio` or `uri` may be set. | false | None | None |
| `uri` | Client-specific URI that points to an audio clip accessible to the client. Dialogflow does not impose any validation on it. This field is part of a union field `content`: Only one of `audio` or `uri` may be set. | false | None | None |

### speech_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpointer_sensitivity` | Sensitivity of the speech model that detects the end of speech. Scale from 0 to 100. | false | None | None |
| `no_speech_timeout` | Timeout before detecting no speech. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". | false | None | None |
| `use_timeout_based_endpointing` | Use timeout based endpointing, interpreting endpointer sensitivity as seconds of timeout value. | false | None | None |
| `models` | Mapping from language to Speech-to-Text model. The mapped Speech-to-Text model will be selected for requests from its corresponding language. For more information, see [Speech models](https://cloud.google.com/dialogflow/cx/docs/concept/speech-models). An object containing a list of **"key": value** pairs. Example: **{ "name": "wrench", "mass": "1.3kg", "count": "3" }**. | false | None | None |

### logging_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_stackdriver_logging` | Enables Google Cloud Logging. | false | None | None |
| `enable_interaction_logging` | Enables DF Interaction logging. | false | None | None |
| `enable_consent_based_redaction` | Enables consent-based end-user input redaction, if true, a pre-defined session parameter **$session.params.conversation-redaction** will be used to determine if the utterance should be redacted. | false | None | None |

### data_store_connections Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_store_type` | The type of the connected data store. * PUBLIC_WEB: A data store that contains public web content. * UNSTRUCTURED: A data store that contains unstructured private data. * STRUCTURED: A data store that contains structured data (for example FAQ). Possible values are: `PUBLIC_WEB`, `UNSTRUCTURED`, `STRUCTURED`. | false | None | None |
| `data_store` | The full name of the referenced data store. Formats: projects/{project}/locations/{location}/collections/{collection}/dataStores/{dataStore} projects/{project}/locations/{location}/dataStores/{dataStore} | false | None | None |
| `document_processing_mode` | The document processing mode for the data store connection. Should only be set for PUBLIC_WEB and UNSTRUCTURED data stores. If not set it is considered as DOCUMENTS, as this is the legacy mode. * DOCUMENTS: Documents are processed as documents. * CHUNKS: Documents are converted to chunks. Possible values are: `DOCUMENTS`, `CHUNKS`. | false | None | None |
