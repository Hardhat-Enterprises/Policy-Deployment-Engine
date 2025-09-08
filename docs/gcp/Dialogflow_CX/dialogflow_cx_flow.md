## 🛡️ Policy Deployment Engine: `dialogflow_cx_flow`

This section provides a concise policy evaluation for the `dialogflow_cx_flow` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_flow](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_flow)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the flow. | true | None | None |
| `description` | The description of the flow. The maximum length is 500 characters. If exceeded, the request is rejected. | false | None | None |
| `transition_route_groups` | A flow's transition route group serve two purposes: They are responsible for matching the user's first utterances in the flow. They are inherited by every page's [transition route groups][Page.transition_route_groups]. Transition route groups defined in the page have higher priority than those defined in the flow. Format:projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/transitionRouteGroups/<TransitionRouteGroup ID>. | false | None | None |
| `parent` | The agent to create a flow for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |
| `language_code` | The language of the following fields in flow: Flow.event_handlers.trigger_fulfillment.messages Flow.event_handlers.trigger_fulfillment.conditional_cases Flow.transition_routes.trigger_fulfillment.messages Flow.transition_routes.trigger_fulfillment.conditional_cases If not specified, the agent's default language is used. Many languages are supported. Note: languages must be enabled in the agent before they can be used. | false | None | None |
| `is_default_start_flow` | The Default Start Flow cannot be deleted; deleting the `google_dialogflow_cx_flow` resource does nothing to the underlying GCP resources. ~> Avoid having multiple `google_dialogflow_cx_flow` resources linked to the same agent with `is_default_start_flow = true` because they will compete to control a single Default Start Flow resource in GCP. | none | None | None |

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

### nlu_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `model_type` | Indicates the type of NLU model. * MODEL_TYPE_STANDARD: Use standard NLU model. * MODEL_TYPE_ADVANCED: Use advanced NLU model. Possible values are: `MODEL_TYPE_STANDARD`, `MODEL_TYPE_ADVANCED`. | false | None | None |
| `classification_threshold` | To filter out false positive results and still get variety in matched natural language inputs for your agent, you can tune the machine learning classification threshold. If the returned score value is less than the threshold value, then a no-match event will be triggered. The score values range from 0.0 (completely uncertain) to 1.0 (completely certain). If set to 0.0, the default of 0.3 is used. | false | None | None |
| `model_training_mode` | Indicates NLU model training mode. * MODEL_TRAINING_MODE_AUTOMATIC: NLU model training is automatically triggered when a flow gets modified. User can also manually trigger model training in this mode. * MODEL_TRAINING_MODE_MANUAL: User needs to manually trigger NLU model training. Best for large flows whose models take long time to train. Possible values are: `MODEL_TRAINING_MODE_AUTOMATIC`, `MODEL_TRAINING_MODE_MANUAL`. | false | None | None |

### advanced_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `audio_export_gcs_destination` | If present, incoming audio is exported by Dialogflow to the configured Google Cloud Storage destination. Exposed at the following levels: * Agent level * Flow level Structure is [documented below](#nested_advanced_settings_audio_export_gcs_destination). | false | None | None |
| `speech_settings` | Settings for speech to text detection. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_speech_settings). | false | None | None |
| `dtmf_settings` | Define behaviors for DTMF (dual tone multi frequency). DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_dtmf_settings). | false | None | None |
| `logging_settings` | Settings for logging. Settings for Dialogflow History, Contact Center messages, StackDriver logs, and speech logging. Exposed at the following levels: * Agent level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_logging_settings). | false | None | None |

### knowledge_connector_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether Knowledge Connector is enabled or not. | false | None | None |
| `trigger_fulfillment` | The fulfillment to be triggered. When the answers from the Knowledge Connector are selected by Dialogflow, you can utitlize the request scoped parameter $request.knowledge.answers (contains up to the 5 highest confidence answers) and $request.knowledge.questions (contains the corresponding questions) to construct the fulfillment. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment). | false | None | None |
| `data_store_connections` | Optional. List of related data store connections. Structure is [documented below](#nested_knowledge_connector_settings_data_store_connections). | false | None | None |
| `target_page` | The target page to transition to. Format: projects/<ProjectID>/locations/<LocationID>/agents/<AgentID>/flows/<FlowID>/pages/<PageID>. The page must be in the same host flow (the flow that owns this `KnowledgeConnectorSettings`). This field is part of a union field `target`: Only one of `targetPage` or `targetFlow` may be set. | false | None | None |
| `target_flow` | The target flow to transition to. Format: projects/<ProjectID>/locations/<LocationID>/agents/<AgentID>/flows/<FlowID>. This field is part of a union field `target`: Only one of `targetPage` or `targetFlow` may be set. | false | None | None |

### trigger_fulfillment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `messages` | The list of rich message responses to present to the user. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages). | false | None | None |
| `webhook` | The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>. | false | None | None |
| `return_partial_responses` | Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks. | false | None | None |
| `tag` | The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified. | false | None | None |
| `set_parameter_actions` | Set parameter values before executing the webhook. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_set_parameter_actions). | false | None | None |
| `conditional_cases` | Conditional cases for this fulfillment. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_conditional_cases). | false | None | None |
| `enable_generative_fallback` | If the flag is true, the agent will utilize LLM to generate a text response. If LLM generation fails, the defined responses in the fulfillment will be respected. This flag is only useful for fulfillments associated with no-match event handlers. | false | None | None |
| `advanced_settings` | Hierarchical advanced settings for agent/flow/page/fulfillment/parameter. Settings exposed at lower level overrides the settings exposed at higher level. Overriding occurs at the sub-setting level. For example, the playbackInterruptionSettings at fulfillment level only overrides the playbackInterruptionSettings at the agent level, leaving other settings at the agent level unchanged. DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Hierarchy: Agent->Flow->Page->Fulfillment/Parameter. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings). | false | None | None |

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

### audio_export_gcs_destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The Google Cloud Storage URI for the exported objects. Whether a full object name, or just a prefix, its usage depends on the Dialogflow operation. Format: gs://bucket/object-name-or-prefix | false | None | None |

### speech_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpointer_sensitivity` | Sensitivity of the speech model that detects the end of speech. Scale from 0 to 100. | false | None | None |
| `no_speech_timeout` | Timeout before detecting no speech. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". | false | None | None |
| `use_timeout_based_endpointing` | Use timeout based endpointing, interpreting endpointer sensitivity as seconds of timeout value. | false | None | None |
| `models` | Mapping from language to Speech-to-Text model. The mapped Speech-to-Text model will be selected for requests from its corresponding language. For more information, see [Speech models](https://cloud.google.com/dialogflow/cx/docs/concept/speech-models). An object containing a list of **"key": value** pairs. Example: **{ "name": "wrench", "mass": "1.3kg", "count": "3" }**. | false | None | None |

### dtmf_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | If true, incoming audio is processed for DTMF (dual tone multi frequtectency) events. For example, if the caller presses a button on their telephone keypad and DTMF processing is enabled, Dialogflow will de the event (e.g. a "3" was pressed) in the incoming audio and pass the event to the bot to drive business logic (e.g. when 3 is pressed, return the account balance). | false | None | None |
| `max_digits` | Max length of DTMF digits. | false | None | None |
| `finish_digit` | The digit that terminates a DTMF digit sequence. | false | None | None |
| `interdigit_timeout_duration` | Interdigit timeout setting for matching dtmf input to regex. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". | false | None | None |
| `endpointing_timeout_duration` | Endpoint timeout setting for matching dtmf input to regex. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". | false | None | None |

### logging_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_stackdriver_logging` | Enables Google Cloud Logging. | false | None | None |
| `enable_interaction_logging` | Enables DF Interaction logging. | false | None | None |
| `enable_consent_based_redaction` | Enables consent-based end-user input redaction, if true, a pre-defined session parameter **$session.params.conversation-redaction** will be used to determine if the utterance should be redacted. | false | None | None |

### segments Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_playback_interruption` | (Output) Whether the playback of this segment can be interrupted by the end user's speech and the client should then start the next Dialogflow request. | none | None | None |
| `audio` | Raw audio synthesized from the Dialogflow agent's response using the output config specified in the request. A base64-encoded string. This field is part of a union field `content`: Only one of `audio` or `uri` may be set. | false | None | None |
| `uri` | Client-specific URI that points to an audio clip accessible to the client. Dialogflow does not impose any validation on it. This field is part of a union field `content`: Only one of `audio` or `uri` may be set. | false | None | None |

### data_store_connections Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_store_type` | The type of the connected data store. * PUBLIC_WEB: A data store that contains public web content. * UNSTRUCTURED: A data store that contains unstructured private data. * STRUCTURED: A data store that contains structured data (for example FAQ). Possible values are: `PUBLIC_WEB`, `UNSTRUCTURED`, `STRUCTURED`. | false | None | None |
| `data_store` | The full name of the referenced data store. Formats: projects/{project}/locations/{location}/collections/{collection}/dataStores/{dataStore} projects/{project}/locations/{location}/dataStores/{dataStore} | false | None | None |
| `document_processing_mode` | The document processing mode for the data store connection. Should only be set for PUBLIC_WEB and UNSTRUCTURED data stores. If not set it is considered as DOCUMENTS, as this is the legacy mode. * DOCUMENTS: Documents are processed as documents. * CHUNKS: Documents are converted to chunks. Possible values are: `DOCUMENTS`, `CHUNKS`. | false | None | None |
