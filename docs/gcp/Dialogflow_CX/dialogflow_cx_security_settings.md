## 🛡️ Policy Deployment Engine: `dialogflow_cx_security_settings`

This section provides a concise policy evaluation for the `dialogflow_cx_security_settings` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_security_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_security_settings)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location these settings are located in. Settings can only be applied to an agent in the same location. See [Available Regions](https://cloud.google.com/dialogflow/cx/docs/concept/region#avail) for a list of supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The human-readable name of the security settings, unique within the location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redaction_strategy`
- Description: (Optional) Defines how we redact data. If not set, defaults to not redacting. * REDACT_WITH_SERVICE: Call redaction service to clean up the data to be persisted. Possible values are: `REDACT_WITH_SERVICE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redaction_scope`
- Description: (Optional) Defines what types of data to redact. If not set, defaults to not redacting any kind of data. * REDACT_DISK_STORAGE: On data to be written to disk or similar devices that are capable of holding data even if power is disconnected. This includes data that are temporarily saved on disk. Possible values are: `REDACT_DISK_STORAGE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_template`
- Description: (Optional) [DLP](https://cloud.google.com/dlp/docs) inspect template name. Use this template to define inspect base settings. If empty, we use the default DLP inspect config. Note: inspectTemplate must be located in the same region as the SecuritySettings. Format: projects/<Project ID>/locations/<Location ID>/inspectTemplates/<Template ID> OR organizations/<Organization ID>/locations/<Location ID>/inspectTemplates/<Template ID>
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deidentify_template`
- Description: (Optional) [DLP](https://cloud.google.com/dlp/docs) deidentify template name. Use this template to define de-identification configuration for the content. If empty, Dialogflow replaces sensitive info with [redacted] text. Note: deidentifyTemplate must be located in the same region as the SecuritySettings. Format: projects/<Project ID>/locations/<Location ID>/deidentifyTemplates/<Template ID> OR organizations/<Organization ID>/locations/<Location ID>/deidentifyTemplates/<Template ID>
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `purge_data_types`
- Description: (Optional) List of types of data to remove when retention settings triggers purge. Each value may be one of: `DIALOGFLOW_HISTORY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_export_settings`
- Description: (Optional) Controls audio export settings for post-conversation analytics when ingesting audio to conversations. If retention_strategy is set to REMOVE_AFTER_CONVERSATION or gcs_bucket is empty, audio export is disabled. If audio export is enabled, audio is recorded and saved to gcs_bucket, subject to retention policy of gcs_bucket. This setting won't effect audio input for implicit sessions via [Sessions.DetectIntent](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.sessions/detectIntent#google.cloud.dialogflow.cx.v3.Sessions.DetectIntent). Structure is [documented below](#nested_audio_export_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `insights_export_settings`
- Description: (Optional) Controls conversation exporting settings to Insights after conversation is completed. If retentionStrategy is set to REMOVE_AFTER_CONVERSATION, Insights export is disabled no matter what you configure here. Structure is [documented below](#nested_insights_export_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_window_days`
- Description: (Optional) Retains the data for the specified number of days. User must set a value lower than Dialogflow's default 365d TTL (30 days for Agent Assist traffic), higher value will be ignored and use default. Setting a value higher than that has no effect. A missing value or setting to 0 also means we use default TTL. Only one of `retention_window_days` and `retention_strategy` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_strategy`
- Description: (Optional) Defines how long we retain persisted data that contains sensitive info. Only one of `retention_window_days` and `retention_strategy` may be set. * REMOVE_AFTER_CONVERSATION: Removes data when the conversation ends. If there is no conversation explicitly established, a default conversation ends when the corresponding Dialogflow session ends. Possible values are: `REMOVE_AFTER_CONVERSATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_audio_export_settings"></a>The `audio_export_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_bucket`
- Description: (Optional) Cloud Storage bucket to export audio record to. Setting this field would grant the Storage Object Creator role to the Dialogflow Service Agent. API caller that tries to modify this field should have the permission of storage.buckets.setIamPolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_export_pattern`
- Description: (Optional) Filename pattern for exported audio.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_audio_redaction`
- Description: (Optional) Enable audio redaction if it is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_format`
- Description: (Optional) File format for exported audio file. Currently only in telephony recordings. * MULAW: G.711 mu-law PCM with 8kHz sample rate. * MP3: MP3 file format. * OGG: OGG Vorbis. Possible values are: `MULAW`, `MP3`, `OGG`. <a name="nested_insights_export_settings"></a>The `insights_export_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_insights_export`
- Description: (Required) If enabled, we will automatically exports conversations to Insights and Insights runs its analyzers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
