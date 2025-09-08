## 🛡️ Policy Deployment Engine: `dialogflow_cx_security_settings`

This section provides a concise policy evaluation for the `dialogflow_cx_security_settings` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_security_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_security_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location these settings are located in. Settings can only be applied to an agent in the same location. See [Available Regions](https://cloud.google.com/dialogflow/cx/docs/concept/region#avail) for a list of supported locations. | true | None | None |
| `display_name` | The human-readable name of the security settings, unique within the location. | true | None | None |
| `redaction_strategy` | Defines how we redact data. If not set, defaults to not redacting. * REDACT_WITH_SERVICE: Call redaction service to clean up the data to be persisted. Possible values are: `REDACT_WITH_SERVICE`. | false | None | None |
| `redaction_scope` | Defines what types of data to redact. If not set, defaults to not redacting any kind of data. * REDACT_DISK_STORAGE: On data to be written to disk or similar devices that are capable of holding data even if power is disconnected. This includes data that are temporarily saved on disk. Possible values are: `REDACT_DISK_STORAGE`. | false | None | None |
| `inspect_template` | [DLP](https://cloud.google.com/dlp/docs) inspect template name. Use this template to define inspect base settings. If empty, we use the default DLP inspect config. Note: inspectTemplate must be located in the same region as the SecuritySettings. Format: projects/<Project ID>/locations/<Location ID>/inspectTemplates/<Template ID> OR organizations/<Organization ID>/locations/<Location ID>/inspectTemplates/<Template ID> | false | None | None |
| `deidentify_template` | [DLP](https://cloud.google.com/dlp/docs) deidentify template name. Use this template to define de-identification configuration for the content. If empty, Dialogflow replaces sensitive info with [redacted] text. Note: deidentifyTemplate must be located in the same region as the SecuritySettings. Format: projects/<Project ID>/locations/<Location ID>/deidentifyTemplates/<Template ID> OR organizations/<Organization ID>/locations/<Location ID>/deidentifyTemplates/<Template ID> | false | None | None |
| `purge_data_types` | List of types of data to remove when retention settings triggers purge. Each value may be one of: `DIALOGFLOW_HISTORY`. | false | None | None |
| `retention_window_days` | Retains the data for the specified number of days. User must set a value lower than Dialogflow's default 365d TTL (30 days for Agent Assist traffic), higher value will be ignored and use default. Setting a value higher than that has no effect. A missing value or setting to 0 also means we use default TTL. Only one of `retention_window_days` and `retention_strategy` may be set. | false | None | None |
| `retention_strategy` | Defines how long we retain persisted data that contains sensitive info. Only one of `retention_window_days` and `retention_strategy` may be set. * REMOVE_AFTER_CONVERSATION: Removes data when the conversation ends. If there is no conversation explicitly established, a default conversation ends when the corresponding Dialogflow session ends. Possible values are: `REMOVE_AFTER_CONVERSATION`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### audio_export_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gcs_bucket` | Cloud Storage bucket to export audio record to. Setting this field would grant the Storage Object Creator role to the Dialogflow Service Agent. API caller that tries to modify this field should have the permission of storage.buckets.setIamPolicy. | false | None | None |
| `audio_export_pattern` | Filename pattern for exported audio. | false | None | None |
| `enable_audio_redaction` | Enable audio redaction if it is true. | false | None | None |
| `audio_format` | File format for exported audio file. Currently only in telephony recordings. * MULAW: G.711 mu-law PCM with 8kHz sample rate. * MP3: MP3 file format. * OGG: OGG Vorbis. Possible values are: `MULAW`, `MP3`, `OGG`. | false | None | None |

### insights_export_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_insights_export` | If enabled, we will automatically exports conversations to Insights and Insights runs its analyzers. | true | None | None |
