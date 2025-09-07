## 🛡️ Policy Deployment Engine: `dialogflow_cx_flow`

This section provides a concise policy evaluation for the `dialogflow_cx_flow` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_flow](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_flow)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the flow. The maximum length is 500 characters. If exceeded, the request is rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transition_routes`
- Description: (Optional) A flow's transition routes serve two purposes: They are responsible for matching the user's first utterances in the flow. They are inherited by every page's [transition routes][Page.transition_routes] and can support use cases such as the user saying "help" or "can I talk to a human?", which can be handled in a common way regardless of the current page. Transition routes defined in the page have higher priority than those defined in the flow. TransitionRoutes are evalauted in the following order: TransitionRoutes with intent specified. TransitionRoutes with only condition specified. TransitionRoutes with intent specified are inherited by pages in the flow. Structure is [documented below](#nested_transition_routes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_handlers`
- Description: (Optional) A flow's event handlers serve two purposes: They are responsible for handling events (e.g. no match, webhook errors) in the flow. They are inherited by every page's [event handlers][Page.event_handlers], which can be used to handle common events regardless of the current page. Event handlers defined in the page have higher priority than those defined in the flow. Unlike transitionRoutes, these handlers are evaluated on a first-match basis. The first one that matches the event get executed, with the rest being ignored. Structure is [documented below](#nested_event_handlers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transition_route_groups`
- Description: (Optional) A flow's transition route group serve two purposes: They are responsible for matching the user's first utterances in the flow. They are inherited by every page's [transition route groups][Page.transition_route_groups]. Transition route groups defined in the page have higher priority than those defined in the flow. Format:projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/transitionRouteGroups/<TransitionRouteGroup ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nlu_settings`
- Description: (Optional) NLU related settings of the flow. Structure is [documented below](#nested_nlu_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_settings`
- Description: (Optional) Hierarchical advanced settings for this flow. The settings exposed at the lower level overrides the settings exposed at the higher level. Hierarchy: Agent->Flow->Page->Fulfillment/Parameter. Structure is [documented below](#nested_advanced_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `knowledge_connector_settings`
- Description: (Optional) Knowledge connector configuration. Structure is [documented below](#nested_knowledge_connector_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create a flow for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language_code`
- Description: (Optional) The language of the following fields in flow: Flow.event_handlers.trigger_fulfillment.messages Flow.event_handlers.trigger_fulfillment.conditional_cases Flow.transition_routes.trigger_fulfillment.messages Flow.transition_routes.trigger_fulfillment.conditional_cases If not specified, the agent's default language is used. Many languages are supported. Note: languages must be enabled in the agent before they can be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_default_start_flow`
- Description: The Default Start Flow cannot be deleted; deleting the `google_dialogflow_cx_flow` resource does nothing to the underlying GCP resources. ~> Avoid having multiple `google_dialogflow_cx_flow` resources linked to the same agent with `is_default_start_flow = true` because they will compete to control a single Default Start Flow resource in GCP. <a name="nested_transition_routes"></a>The `transition_routes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Output) The unique identifier of this transition route.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intent`
- Description: (Optional) The unique identifier of an Intent. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/intents/<Intent ID>. Indicates that the transition can only happen when the given intent is matched. At least one of intent or condition must be specified. When both intent and condition are specified, the transition can only happen when both are fulfilled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) The condition to evaluate against form parameters or session parameters. At least one of intent or condition must be specified. When both intent and condition are specified, the transition can only happen when both are fulfilled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_fulfillment`
- Description: (Optional) The fulfillment to call when the condition is satisfied. At least one of triggerFulfillment and target must be specified. When both are defined, triggerFulfillment is executed first. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_page`
- Description: (Optional) The target page to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_flow`
- Description: (Optional) The target flow to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. <a name="nested_transition_routes_transition_routes_trigger_fulfillment"></a>The `trigger_fulfillment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `messages`
- Description: (Optional) The list of rich message responses to present to the user. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook`
- Description: (Optional) The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `return_partial_responses`
- Description: (Optional) Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set_parameter_actions`
- Description: (Optional) Set parameter values before executing the webhook. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_set_parameter_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditional_cases`
- Description: (Optional) Conditional cases for this fulfillment. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_conditional_cases). <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages"></a>The `messages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel`
- Description: (Optional) The channel which the response is associated with. Clients can specify the channel via QueryParameters.channel, and only associated channel response will be returned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The text response message. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `payload`
- Description: (Optional) A custom, platform-specific payload.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conversation_success`
- Description: (Optional) Indicates that the conversation succeeded, i.e., the bot handled the issue that the customer talked to it about. Dialogflow only uses this to determine which conversations should be counted as successful and doesn't process the metadata in this message in any way. Note that Dialogflow also considers conversations that get to the conversation end page as successful even if they don't return ConversationSuccess. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates that the conversation succeeded. * In a webhook response when you determine that you handled the customer issue. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_conversation_success).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_audio_text`
- Description: (Optional) A text or ssml response that is preferentially used for TTS output audio synthesis, as described in the comment on the ResponseMessage message. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_output_audio_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `live_agent_handoff`
- Description: (Optional) Indicates that the conversation should be handed off to a live agent. Dialogflow only uses this to determine which conversations were handed off to a human agent for measurement purposes. What else to do with this signal is up to you and your handoff procedures. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates something went extremely wrong in the conversation. * In a webhook response when you determine that the customer issue can only be handled by a human. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_live_agent_handoff).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `play_audio`
- Description: (Optional) Specifies an audio clip to be played by the client as part of the response. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_play_audio).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `telephony_transfer_call`
- Description: (Optional) Represents the signal that telles the client to transfer the phone call connected to the agent to a third-party endpoint. Structure is [documented below](#nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_telephony_transfer_call). <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_text"></a>The `text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) A collection of text responses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_conversation_success"></a>The `conversation_success` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata. Dialogflow doesn't impose any structure on this. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_output_audio_text"></a>The `output_audio_text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The raw text to be synthesized.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssml`
- Description: (Optional) The SSML text to be synthesized. For more information, see SSML. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_live_agent_handoff"></a>The `live_agent_handoff` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata. Dialogflow doesn't impose any structure on this. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_play_audio"></a>The `play_audio` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_uri`
- Description: (Required) URI of the audio clip. Dialogflow does not impose any validation on this value. It is specific to the client that reads it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_messages_messages_telephony_transfer_call"></a>The `telephony_transfer_call` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Required) Transfer the call to a phone number in E.164 format. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_set_parameter_actions"></a>The `set_parameter_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter`
- Description: (Optional) Display name of the parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The new JSON-encoded value of the parameter. A null value clears the parameter. <a name="nested_transition_routes_transition_routes_trigger_fulfillment_conditional_cases"></a>The `conditional_cases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cases`
- Description: (Optional) A JSON encoded list of cascading if-else conditions. Cases are mutually exclusive. The first one with a matching condition is selected, all the rest ignored. See [Case](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/Fulfillment#case) for the schema. <a name="nested_event_handlers"></a>The `event_handlers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Output) The unique identifier of this event handler.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event`
- Description: (Optional) The name of the event to handle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_fulfillment`
- Description: (Optional) The fulfillment to call when the event occurs. Handling webhook errors with a fulfillment enabled with webhook could cause infinite loop. It is invalid to specify such fulfillment for a handler handling webhooks. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_page`
- Description: (Optional) The target page to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>/pages/<Page ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_flow`
- Description: (Optional) The target flow to transition to. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. <a name="nested_event_handlers_event_handlers_trigger_fulfillment"></a>The `trigger_fulfillment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `messages`
- Description: (Optional) The list of rich message responses to present to the user. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook`
- Description: (Optional) The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `return_partial_responses`
- Description: (Optional) Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set_parameter_actions`
- Description: (Optional) Set parameter values before executing the webhook. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_set_parameter_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditional_cases`
- Description: (Optional) Conditional cases for this fulfillment. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_conditional_cases).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_generative_fallback`
- Description: (Optional) If the flag is true, the agent will utilize LLM to generate a text response. If LLM generation fails, the defined responses in the fulfillment will be respected. This flag is only useful for fulfillments associated with no-match event handlers. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages"></a>The `messages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel`
- Description: (Optional) The channel which the response is associated with. Clients can specify the channel via QueryParameters.channel, and only associated channel response will be returned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The text response message. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `payload`
- Description: (Optional) A custom, platform-specific payload.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conversation_success`
- Description: (Optional) Indicates that the conversation succeeded, i.e., the bot handled the issue that the customer talked to it about. Dialogflow only uses this to determine which conversations should be counted as successful and doesn't process the metadata in this message in any way. Note that Dialogflow also considers conversations that get to the conversation end page as successful even if they don't return ConversationSuccess. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates that the conversation succeeded. * In a webhook response when you determine that you handled the customer issue. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_conversation_success).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_audio_text`
- Description: (Optional) A text or ssml response that is preferentially used for TTS output audio synthesis, as described in the comment on the ResponseMessage message. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_output_audio_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `live_agent_handoff`
- Description: (Optional) Indicates that the conversation should be handed off to a live agent. Dialogflow only uses this to determine which conversations were handed off to a human agent for measurement purposes. What else to do with this signal is up to you and your handoff procedures. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates something went extremely wrong in the conversation. * In a webhook response when you determine that the customer issue can only be handled by a human. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_live_agent_handoff).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `play_audio`
- Description: (Optional) Specifies an audio clip to be played by the client as part of the response. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_play_audio).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `telephony_transfer_call`
- Description: (Optional) Represents the signal that telles the client to transfer the phone call connected to the agent to a third-party endpoint. Structure is [documented below](#nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_telephony_transfer_call). <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_text"></a>The `text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) A collection of text responses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_conversation_success"></a>The `conversation_success` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata. Dialogflow doesn't impose any structure on this. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_output_audio_text"></a>The `output_audio_text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The raw text to be synthesized.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssml`
- Description: (Optional) The SSML text to be synthesized. For more information, see SSML. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_live_agent_handoff"></a>The `live_agent_handoff` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata. Dialogflow doesn't impose any structure on this. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_play_audio"></a>The `play_audio` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_uri`
- Description: (Required) URI of the audio clip. Dialogflow does not impose any validation on this value. It is specific to the client that reads it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_messages_messages_telephony_transfer_call"></a>The `telephony_transfer_call` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Required) Transfer the call to a phone number in E.164 format. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_set_parameter_actions"></a>The `set_parameter_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter`
- Description: (Optional) Display name of the parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The new JSON-encoded value of the parameter. A null value clears the parameter. <a name="nested_event_handlers_event_handlers_trigger_fulfillment_conditional_cases"></a>The `conditional_cases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cases`
- Description: (Optional) A JSON encoded list of cascading if-else conditions. Cases are mutually exclusive. The first one with a matching condition is selected, all the rest ignored. See [Case](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/Fulfillment#case) for the schema. <a name="nested_nlu_settings"></a>The `nlu_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `model_type`
- Description: (Optional) Indicates the type of NLU model. * MODEL_TYPE_STANDARD: Use standard NLU model. * MODEL_TYPE_ADVANCED: Use advanced NLU model. Possible values are: `MODEL_TYPE_STANDARD`, `MODEL_TYPE_ADVANCED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `classification_threshold`
- Description: (Optional) To filter out false positive results and still get variety in matched natural language inputs for your agent, you can tune the machine learning classification threshold. If the returned score value is less than the threshold value, then a no-match event will be triggered. The score values range from 0.0 (completely uncertain) to 1.0 (completely certain). If set to 0.0, the default of 0.3 is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `model_training_mode`
- Description: (Optional) Indicates NLU model training mode. * MODEL_TRAINING_MODE_AUTOMATIC: NLU model training is automatically triggered when a flow gets modified. User can also manually trigger model training in this mode. * MODEL_TRAINING_MODE_MANUAL: User needs to manually trigger NLU model training. Best for large flows whose models take long time to train. Possible values are: `MODEL_TRAINING_MODE_AUTOMATIC`, `MODEL_TRAINING_MODE_MANUAL`. <a name="nested_advanced_settings"></a>The `advanced_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_export_gcs_destination`
- Description: (Optional) If present, incoming audio is exported by Dialogflow to the configured Google Cloud Storage destination. Exposed at the following levels: * Agent level * Flow level Structure is [documented below](#nested_advanced_settings_audio_export_gcs_destination).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `speech_settings`
- Description: (Optional) Settings for speech to text detection. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_advanced_settings_speech_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dtmf_settings`
- Description: (Optional) Define behaviors for DTMF (dual tone multi frequency). DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_advanced_settings_dtmf_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_settings`
- Description: (Optional) Settings for logging. Settings for Dialogflow History, Contact Center messages, StackDriver logs, and speech logging. Exposed at the following levels: * Agent level Structure is [documented below](#nested_advanced_settings_logging_settings). <a name="nested_advanced_settings_audio_export_gcs_destination"></a>The `audio_export_gcs_destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) The Google Cloud Storage URI for the exported objects. Whether a full object name, or just a prefix, its usage depends on the Dialogflow operation. Format: gs://bucket/object-name-or-prefix <a name="nested_advanced_settings_speech_settings"></a>The `speech_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpointer_sensitivity`
- Description: (Optional) Sensitivity of the speech model that detects the end of speech. Scale from 0 to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_speech_timeout`
- Description: (Optional) Timeout before detecting no speech. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_timeout_based_endpointing`
- Description: (Optional) Use timeout based endpointing, interpreting endpointer sensitivity as seconds of timeout value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `models`
- Description: (Optional) Mapping from language to Speech-to-Text model. The mapped Speech-to-Text model will be selected for requests from its corresponding language. For more information, see [Speech models](https://cloud.google.com/dialogflow/cx/docs/concept/speech-models). An object containing a list of **"key": value** pairs. Example: **{ "name": "wrench", "mass": "1.3kg", "count": "3" }**. <a name="nested_advanced_settings_dtmf_settings"></a>The `dtmf_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If true, incoming audio is processed for DTMF (dual tone multi frequency) events. For example, if the caller presses a button on their telephone keypad and DTMF processing is enabled, Dialogflow will detect the event (e.g. a "3" was pressed) in the incoming audio and pass the event to the bot to drive business logic (e.g. when 3 is pressed, return the account balance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_digits`
- Description: (Optional) Max length of DTMF digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `finish_digit`
- Description: (Optional) The digit that terminates a DTMF digit sequence. <a name="nested_advanced_settings_logging_settings"></a>The `logging_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_stackdriver_logging`
- Description: (Optional) Enables Google Cloud Logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_interaction_logging`
- Description: (Optional) Enables DF Interaction logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_consent_based_redaction`
- Description: (Optional) Enables consent-based end-user input redaction, if true, a pre-defined session parameter **$session.params.conversation-redaction** will be used to determine if the utterance should be redacted. <a name="nested_knowledge_connector_settings"></a>The `knowledge_connector_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether Knowledge Connector is enabled or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_fulfillment`
- Description: (Optional) The fulfillment to be triggered. When the answers from the Knowledge Connector are selected by Dialogflow, you can utitlize the request scoped parameter $request.knowledge.answers (contains up to the 5 highest confidence answers) and $request.knowledge.questions (contains the corresponding questions) to construct the fulfillment. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_connections`
- Description: (Optional) Optional. List of related data store connections. Structure is [documented below](#nested_knowledge_connector_settings_data_store_connections).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_page`
- Description: (Optional) The target page to transition to. Format: projects/<ProjectID>/locations/<LocationID>/agents/<AgentID>/flows/<FlowID>/pages/<PageID>. The page must be in the same host flow (the flow that owns this `KnowledgeConnectorSettings`). This field is part of a union field `target`: Only one of `targetPage` or `targetFlow` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_flow`
- Description: (Optional) The target flow to transition to. Format: projects/<ProjectID>/locations/<LocationID>/agents/<AgentID>/flows/<FlowID>. This field is part of a union field `target`: Only one of `targetPage` or `targetFlow` may be set. <a name="nested_knowledge_connector_settings_trigger_fulfillment"></a>The `trigger_fulfillment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `messages`
- Description: (Optional) The list of rich message responses to present to the user. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook`
- Description: (Optional) The webhook to call. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/webhooks/<Webhook ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `return_partial_responses`
- Description: (Optional) Whether Dialogflow should return currently queued fulfillment response messages in streaming APIs. If a webhook is specified, it happens before Dialogflow invokes webhook. Warning: 1) This flag only affects streaming API. Responses are still queued and returned once in non-streaming API. 2) The flag can be enabled in any fulfillment but only the first 3 partial responses will be returned. You may only want to apply it to fulfillments that have slow webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag used by the webhook to identify which fulfillment is being called. This field is required if webhook is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set_parameter_actions`
- Description: (Optional) Set parameter values before executing the webhook. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_set_parameter_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditional_cases`
- Description: (Optional) Conditional cases for this fulfillment. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_conditional_cases).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_settings`
- Description: (Optional) Hierarchical advanced settings for agent/flow/page/fulfillment/parameter. Settings exposed at lower level overrides the settings exposed at higher level. Overriding occurs at the sub-setting level. For example, the playbackInterruptionSettings at fulfillment level only overrides the playbackInterruptionSettings at the agent level, leaving other settings at the agent level unchanged. DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Hierarchy: Agent->Flow->Page->Fulfillment/Parameter. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_generative_fallback`
- Description: (Optional) If the flag is true, the agent will utilize LLM to generate a text response. If LLM generation fails, the defined responses in the fulfillment will be respected. This flag is only useful for fulfillments associated with no-match event handlers. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages"></a>The `messages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel`
- Description: (Optional) The channel which the response is associated with. Clients can specify the channel via QueryParameters.channel, and only associated channel response will be returned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The text response message. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `payload`
- Description: (Optional) Returns a response containing a custom, platform-specific payload. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conversation_success`
- Description: (Optional) Indicates that the conversation succeeded, i.e., the bot handled the issue that the customer talked to it about. Dialogflow only uses this to determine which conversations should be counted as successful and doesn't process the metadata in this message in any way. Note that Dialogflow also considers conversations that get to the conversation end page as successful even if they don't return ConversationSuccess. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates that the conversation succeeded. * In a webhook response when you determine that you handled the customer issue. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_conversation_success).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_audio_text`
- Description: (Optional) A text or ssml response that is preferentially used for TTS output audio synthesis, as described in the comment on the ResponseMessage message. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_output_audio_text).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `live_agent_handoff`
- Description: (Optional) Indicates that the conversation should be handed off to a live agent. Dialogflow only uses this to determine which conversations were handed off to a human agent for measurement purposes. What else to do with this signal is up to you and your handoff procedures. You may set this, for example: * In the entryFulfillment of a Page if entering the page indicates something went extremely wrong in the conversation. * In a webhook response when you determine that the customer issue can only be handled by a human. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_live_agent_handoff).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_interaction`
- Description: (Output) This type has no fields. Indicates that interaction with the Dialogflow agent has ended. This message is generated by Dialogflow only and not supposed to be defined by the user. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `play_audio`
- Description: (Optional) Specifies an audio clip to be played by the client as part of the response. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_play_audio).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mixed_audio`
- Description: (Output) Represents an audio message that is composed of both segments synthesized from the Dialogflow agent prompts and ones hosted externally at the specified URIs. The external URIs are specified via playAudio. This message is generated by Dialogflow only and not supposed to be defined by the user. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_mixed_audio).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `telephony_transfer_call`
- Description: (Optional) Represents the signal that telles the client to transfer the phone call connected to the agent to a third-party endpoint. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_telephony_transfer_call).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `knowledge_info_card`
- Description: (Optional) This type has no fields. Represents info card response. If the response contains generative knowledge prediction, Dialogflow will return a payload with Infobot Messenger compatible info card. Otherwise, the info card response is skipped. This field is part of a union field `message`: Only one of `text`, `payload`, `conversationSuccess`, `outputAudioText`, `liveAgentHandoff`, `endInteraction`, `playAudio`, `mixedAudio`, `telephonyTransferCall`, or `knowledgeInfoCard` may be set. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_text"></a>The `text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) A collection of text response variants. If multiple variants are defined, only one text response variant is returned at runtime. required: true
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_conversation_success"></a>The `conversation_success` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata. Dialogflow doesn't impose any structure on this. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_output_audio_text"></a>The `output_audio_text` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The raw text to be synthesized. This field is part of a union field `source`: Only one of `text` or `ssml` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssml`
- Description: (Optional) The SSML text to be synthesized. For more information, see SSML. This field is part of a union field `source`: Only one of `text` or `ssml` may be set. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_live_agent_handoff"></a>The `live_agent_handoff` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata. Dialogflow doesn't impose any structure on this. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_play_audio"></a>The `play_audio` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_uri`
- Description: (Required) URI of the audio clip. Dialogflow does not impose any validation on this value. It is specific to the client that reads it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this message can be interrupted by the end user's speech and the client can then starts the next Dialogflow request. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_mixed_audio"></a>The `mixed_audio` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `segments`
- Description: (Optional) Segments this audio response is composed of. Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_mixed_audio_segments). <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_mixed_audio_segments"></a>The `segments` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_playback_interruption`
- Description: (Output) Whether the playback of this segment can be interrupted by the end user's speech and the client should then start the next Dialogflow request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio`
- Description: (Optional) Raw audio synthesized from the Dialogflow agent's response using the output config specified in the request. A base64-encoded string. This field is part of a union field `content`: Only one of `audio` or `uri` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) Client-specific URI that points to an audio clip accessible to the client. Dialogflow does not impose any validation on it. This field is part of a union field `content`: Only one of `audio` or `uri` may be set. <a name="nested_knowledge_connector_settings_trigger_fulfillment_messages_messages_telephony_transfer_call"></a>The `telephony_transfer_call` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Required) Transfer the call to a phone number in E.164 format. <a name="nested_knowledge_connector_settings_trigger_fulfillment_set_parameter_actions"></a>The `set_parameter_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter`
- Description: (Optional) Display name of the parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The new JSON-encoded value of the parameter. A null value clears the parameter. <a name="nested_knowledge_connector_settings_trigger_fulfillment_conditional_cases"></a>The `conditional_cases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cases`
- Description: (Optional) A JSON encoded list of cascading if-else conditions. Cases are mutually exclusive. The first one with a matching condition is selected, all the rest ignored. See [Case](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/Fulfillment#case) for the schema. <a name="nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings"></a>The `advanced_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `speech_settings`
- Description: (Optional) Settings for speech to text detection. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_speech_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dtmf_settings`
- Description: (Optional) Define behaviors for DTMF (dual tone multi frequency). DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_dtmf_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_settings`
- Description: (Optional) Settings for logging. Settings for Dialogflow History, Contact Center messages, StackDriver logs, and speech logging. Exposed at the following levels: * Agent level Structure is [documented below](#nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_logging_settings). <a name="nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_speech_settings"></a>The `speech_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpointer_sensitivity`
- Description: (Optional) Sensitivity of the speech model that detects the end of speech. Scale from 0 to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_speech_timeout`
- Description: (Optional) Timeout before detecting no speech. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_timeout_based_endpointing`
- Description: (Optional) Use timeout based endpointing, interpreting endpointer sensitivity as seconds of timeout value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `models`
- Description: (Optional) Mapping from language to Speech-to-Text model. The mapped Speech-to-Text model will be selected for requests from its corresponding language. For more information, see [Speech models](https://cloud.google.com/dialogflow/cx/docs/concept/speech-models). An object containing a list of **"key": value** pairs. Example: **{ "name": "wrench", "mass": "1.3kg", "count": "3" }**. <a name="nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_dtmf_settings"></a>The `dtmf_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If true, incoming audio is processed for DTMF (dual tone multi frequtectency) events. For example, if the caller presses a button on their telephone keypad and DTMF processing is enabled, Dialogflow will de the event (e.g. a "3" was pressed) in the incoming audio and pass the event to the bot to drive business logic (e.g. when 3 is pressed, return the account balance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_digits`
- Description: (Optional) Max length of DTMF digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `finish_digit`
- Description: (Optional) The digit that terminates a DTMF digit sequence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interdigit_timeout_duration`
- Description: (Optional) Interdigit timeout setting for matching dtmf input to regex. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpointing_timeout_duration`
- Description: (Optional) Endpoint timeout setting for matching dtmf input to regex. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.500s". <a name="nested_knowledge_connector_settings_trigger_fulfillment_advanced_settings_logging_settings"></a>The `logging_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_stackdriver_logging`
- Description: (Optional) Enables Google Cloud Logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_interaction_logging`
- Description: (Optional) Enables DF Interaction logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_consent_based_redaction`
- Description: (Optional) Enables consent-based end-user input redaction, if true, a pre-defined session parameter **$session.params.conversation-redaction** will be used to determine if the utterance should be redacted. <a name="nested_knowledge_connector_settings_data_store_connections"></a>The `data_store_connections` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_type`
- Description: (Optional) The type of the connected data store. * PUBLIC_WEB: A data store that contains public web content. * UNSTRUCTURED: A data store that contains unstructured private data. * STRUCTURED: A data store that contains structured data (for example FAQ). Possible values are: `PUBLIC_WEB`, `UNSTRUCTURED`, `STRUCTURED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store`
- Description: (Optional) The full name of the referenced data store. Formats: projects/{project}/locations/{location}/collections/{collection}/dataStores/{dataStore} projects/{project}/locations/{location}/dataStores/{dataStore}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `document_processing_mode`
- Description: (Optional) The document processing mode for the data store connection. Should only be set for PUBLIC_WEB and UNSTRUCTURED data stores. If not set it is considered as DOCUMENTS, as this is the legacy mode. * DOCUMENTS: Documents are processed as documents. * CHUNKS: Documents are converted to chunks. Possible values are: `DOCUMENTS`, `CHUNKS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
