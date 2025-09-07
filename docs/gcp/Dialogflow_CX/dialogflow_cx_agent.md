## 🛡️ Policy Deployment Engine: `dialogflow_cx_agent`

This section provides a concise policy evaluation for the `dialogflow_cx_agent` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_agent)

---

## 1. Argument Reference

### `location`
- Description: (Required) The name of the location this agent is located in. ~> **Note:** The first time you are deploying an Agent in your project you must configure location settings. This is a one time step but at the moment you can only [configure location settings](https://cloud.google.com/dialogflow/cx/docs/concept/region#location-settings) via the Dialogflow CX console. Another options is to use global location so you don't need to manually configure location settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The human-readable name of the agent, unique within the location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_language_code`
- Description: (Required) The default language of the agent as a language tag. [See Language Support](https://cloud.google.com/dialogflow/cx/docs/reference/language) for a list of the currently supported language codes. This field cannot be updated after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) The time zone of this agent from the [time zone database](https://www.iana.org/time-zones), e.g., America/New_York, Europe/Paris.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `supported_language_codes`
- Description: (Optional) The list of all languages supported by this agent (except for the default_language_code).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of this agent. The maximum length is 500 characters. If exceeded, the request is rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `avatar_uri`
- Description: (Optional) The URI of the agent's avatar. Avatars are used throughout the Dialogflow console and in the self-hosted Web Demo integration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `speech_to_text_settings`
- Description: (Optional) Settings related to speech recognition. Structure is [documented below](#nested_speech_to_text_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_settings`
- Description: (Optional) Name of the SecuritySettings reference for the agent. Format: projects/<Project ID>/locations/<Location ID>/securitySettings/<Security Settings ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_stackdriver_logging`
- Description: (Optional, Deprecated) Determines whether this agent should log conversation queries. ~> **Warning:** `enable_stackdriver_logging` is deprecated and will be removed in a future major release. Please use `advanced_settings.logging_settings.enable_stackdriver_logging`instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_spell_correction`
- Description: (Optional) Indicates if automatic spell correction is enabled in detect intent requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_settings`
- Description: (Optional) Hierarchical advanced settings for this agent. The settings exposed at the lower level overrides the settings exposed at the higher level. Hierarchy: Agent->Flow->Page->Fulfillment/Parameter. Structure is [documented below](#nested_advanced_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git_integration_settings`
- Description: (Optional) Git integration settings for this agent. Structure is [documented below](#nested_git_integration_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text_to_speech_settings`
- Description: (Optional) Settings related to speech synthesizing. Structure is [documented below](#nested_text_to_speech_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gen_app_builder_settings`
- Description: (Optional) Gen App Builder-related agent-level settings. Structure is [documented below](#nested_gen_app_builder_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_chat_engine_on_destroy`
- Description: Otherwise, the chat engine will persist. This virtual field addresses a critical dependency chain: `agent` -> `engine` -> `data store`. The chat engine is automatically provisioned when a data store is linked to the agent, meaning Terraform doesn't have direct control over its lifecycle as a managed resource. This creates a problem when both the agent and data store are managed by Terraform and need to be destroyed. Without delete_chat_engine_on_destroy set to true, the data store's deletion would fail because the unmanaged chat engine would still be using it. This setting ensures that the entire dependency chain can be properly torn down. See `mmv1/templates/terraform/examples/dialogflowcx_tool_data_store.tf.tmpl` as an example. Data store can be linked to an agent through the `knowledgeConnectorSettings` field of a [flow](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.flows#resource:-flow) or a [page](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.flows.pages#resource:-page) or the `dataStoreSpec` field of a [tool](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#resource:-tool). The ID of the implicitly created engine is stored in the `genAppBuilderSettings` field of the [agent](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents#resource:-agent). <a name="nested_speech_to_text_settings"></a>The `speech_to_text_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_speech_adaptation`
- Description: (Optional) Whether to use speech adaptation for speech recognition. <a name="nested_advanced_settings"></a>The `advanced_settings` block supports:
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
- Description: (Optional) Enables consent-based end-user input redaction, if true, a pre-defined session parameter **$session.params.conversation-redaction** will be used to determine if the utterance should be redacted. <a name="nested_git_integration_settings"></a>The `git_integration_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github_settings`
- Description: (Optional) Settings of integration with GitHub. Structure is [documented below](#nested_git_integration_settings_github_settings). <a name="nested_git_integration_settings_github_settings"></a>The `github_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The unique repository display name for the GitHub repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_uri`
- Description: (Optional) The GitHub repository URI related to the agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tracking_branch`
- Description: (Optional) The branch of the GitHub repository tracked for this agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_token`
- Description: (Optional) The access token used to authenticate the access to the GitHub repository. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branches`
- Description: (Optional) A list of branches configured to be used from Dialogflow. <a name="nested_text_to_speech_settings"></a>The `text_to_speech_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `synthesize_speech_configs`
- Description: (Optional) Configuration of how speech should be synthesized, mapping from [language](https://cloud.google.com/dialogflow/cx/docs/reference/language) to [SynthesizeSpeechConfig](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents#synthesizespeechconfig). These settings affect: * The phone gateway synthesize configuration set via Agent.text_to_speech_settings. * How speech is synthesized when invoking session APIs. `Agent.text_to_speech_settings` only applies if `OutputAudioConfig.synthesize_speech_config` is not specified. <a name="nested_gen_app_builder_settings"></a>The `gen_app_builder_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine`
- Description: (Required) The full name of the Gen App Builder engine related to this agent if there is one. Format: projects/{Project ID}/locations/{Location ID}/collections/{Collection ID}/engines/{Engine ID}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
