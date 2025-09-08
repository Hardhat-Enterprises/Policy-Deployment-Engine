## 🛡️ Policy Deployment Engine: `dialogflow_cx_agent`

This section provides a concise policy evaluation for the `dialogflow_cx_agent` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_agent)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The name of the location this agent is located in. ~> **Note:** The first time you are deploying an Agent in your project you must configure location settings. This is a one time step but at the moment you can only [configure location settings](https://cloud.google.com/dialogflow/cx/docs/concept/region#location-settings) via the Dialogflow CX console. Another options is to use global location so you don't need to manually configure location settings. | true | None | None |
| `display_name` | The human-readable name of the agent, unique within the location. | true | None | None |
| `default_language_code` | The default language of the agent as a language tag. [See Language Support](https://cloud.google.com/dialogflow/cx/docs/reference/language) for a list of the currently supported language codes. This field cannot be updated after creation. | true | None | None |
| `time_zone` | The time zone of this agent from the [time zone database](https://www.iana.org/time-zones), e.g., America/New_York, Europe/Paris. | true | None | None |
| `supported_language_codes` | The list of all languages supported by this agent (except for the default_language_code). | false | None | None |
| `description` | The description of this agent. The maximum length is 500 characters. If exceeded, the request is rejected. | false | None | None |
| `avatar_uri` | The URI of the agent's avatar. Avatars are used throughout the Dialogflow console and in the self-hosted Web Demo integration. | false | None | None |
| `security_settings` | Name of the SecuritySettings reference for the agent. Format: projects/<Project ID>/locations/<Location ID>/securitySettings/<Security Settings ID>. | false | None | None |
| `enable_stackdriver_logging` | , Deprecated) Determines whether this agent should log conversation queries. ~> **Warning:** `enable_stackdriver_logging` is deprecated and will be removed in a future major release. Please use `advanced_settings.logging_settings.enable_stackdriver_logging`instead. | false | None | None |
| `enable_spell_correction` | Indicates if automatic spell correction is enabled in detect intent requests. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `delete_chat_engine_on_destroy` | Otherwise, the chat engine will persist. This virtual field addresses a critical dependency chain: `agent` -> `engine` -> `data store`. The chat engine is automatically provisioned when a data store is linked to the agent, meaning Terraform doesn't have direct control over its lifecycle as a managed resource. This creates a problem when both the agent and data store are managed by Terraform and need to be destroyed. Without delete_chat_engine_on_destroy set to true, the data store's deletion would fail because the unmanaged chat engine would still be using it. This setting ensures that the entire dependency chain can be properly torn down. See `mmv1/templates/terraform/examples/dialogflowcx_tool_data_store.tf.tmpl` as an example. Data store can be linked to an agent through the `knowledgeConnectorSettings` field of a [flow](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.flows#resource:-flow) or a [page](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.flows.pages#resource:-page) or the `dataStoreSpec` field of a [tool](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#resource:-tool). The ID of the implicitly created engine is stored in the `genAppBuilderSettings` field of the [agent](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents#resource:-agent). | none | None | None |

### speech_to_text_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_speech_adaptation` | Whether to use speech adaptation for speech recognition. | false | None | None |

### advanced_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `audio_export_gcs_destination` | If present, incoming audio is exported by Dialogflow to the configured Google Cloud Storage destination. Exposed at the following levels: * Agent level * Flow level Structure is [documented below](#nested_advanced_settings_audio_export_gcs_destination). | false | None | None |
| `speech_settings` | Settings for speech to text detection. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_advanced_settings_speech_settings). | false | None | None |
| `dtmf_settings` | Define behaviors for DTMF (dual tone multi frequency). DTMF settings does not override each other. DTMF settings set at different levels define DTMF detections running in parallel. Exposed at the following levels: * Agent level * Flow level * Page level * Parameter level Structure is [documented below](#nested_advanced_settings_dtmf_settings). | false | None | None |
| `logging_settings` | Settings for logging. Settings for Dialogflow History, Contact Center messages, StackDriver logs, and speech logging. Exposed at the following levels: * Agent level Structure is [documented below](#nested_advanced_settings_logging_settings). | false | None | None |

### git_integration_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `github_settings` | Settings of integration with GitHub. Structure is [documented below](#nested_git_integration_settings_github_settings). | false | None | None |

### text_to_speech_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `synthesize_speech_configs` | Configuration of how speech should be synthesized, mapping from [language](https://cloud.google.com/dialogflow/cx/docs/reference/language) to [SynthesizeSpeechConfig](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents#synthesizespeechconfig). These settings affect: * The phone gateway synthesize configuration set via Agent.text_to_speech_settings. * How speech is synthesized when invoking session APIs. `Agent.text_to_speech_settings` only applies if `OutputAudioConfig.synthesize_speech_config` is not specified. | false | None | None |

### gen_app_builder_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `engine` | The full name of the Gen App Builder engine related to this agent if there is one. Format: projects/{Project ID}/locations/{Location ID}/collections/{Collection ID}/engines/{Engine ID} | true | None | None |

### audio_export_gcs_destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The Google Cloud Storage URI for the exported objects. Whether a full object name, or just a prefix, its usage depends on the Dialogflow operation. Format: gs://bucket/object-name-or-prefix | false | None | None |

### speech_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpointer_sensitivity` | Sensitivity of the speech model that detects the end of speech. Scale from 0 to 100. | false | None | None |
| `no_speech_timeout` | Timeout before detecting no speech. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
| `use_timeout_based_endpointing` | Use timeout based endpointing, interpreting endpointer sensitivity as seconds of timeout value. | false | None | None |
| `models` | Mapping from language to Speech-to-Text model. The mapped Speech-to-Text model will be selected for requests from its corresponding language. For more information, see [Speech models](https://cloud.google.com/dialogflow/cx/docs/concept/speech-models). An object containing a list of **"key": value** pairs. Example: **{ "name": "wrench", "mass": "1.3kg", "count": "3" }**. | false | None | None |

### dtmf_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | If true, incoming audio is processed for DTMF (dual tone multi frequency) events. For example, if the caller presses a button on their telephone keypad and DTMF processing is enabled, Dialogflow will detect the event (e.g. a "3" was pressed) in the incoming audio and pass the event to the bot to drive business logic (e.g. when 3 is pressed, return the account balance). | false | None | None |
| `max_digits` | Max length of DTMF digits. | false | None | None |
| `finish_digit` | The digit that terminates a DTMF digit sequence. | false | None | None |

### logging_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_stackdriver_logging` | Enables Google Cloud Logging. | false | None | None |
| `enable_interaction_logging` | Enables DF Interaction logging. | false | None | None |
| `enable_consent_based_redaction` | Enables consent-based end-user input redaction, if true, a pre-defined session parameter **$session.params.conversation-redaction** will be used to determine if the utterance should be redacted. | false | None | None |

### github_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The unique repository display name for the GitHub repository. | false | None | None |
| `repository_uri` | The GitHub repository URI related to the agent. | false | None | None |
| `tracking_branch` | The branch of the GitHub repository tracked for this agent. | false | None | None |
| `access_token` | The access token used to authenticate the access to the GitHub repository. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `branches` | A list of branches configured to be used from Dialogflow. | false | None | None |
