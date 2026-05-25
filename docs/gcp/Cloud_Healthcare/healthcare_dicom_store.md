## 🛡️ Policy Deployment Engine: `healthcare_dicom_store`

This section provides a concise policy evaluation for the `healthcare_dicom_store` resource in GCP.

Reference: [Terraform Registry – healthcare_dicom_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dicom_store)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name for the DicomStore. ** Changing this property may recreate the Dicom store (removing all data) ** | true | false | The name is a resource identifier only and does not affect security posture. | None | None |
| `dataset` | Identifies the dataset addressed by this request. Must be in the format 'projects/{project}/locations/{location}/datasets/{dataset}' | true | false | The dataset field is a required reference to the parent dataset and does not directly affect security posture. | None | None |
| `labels` | User-supplied key-value pairs used to organize DICOM stores. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values are optional, must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be associated with a given store. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels are essential for resource governance, cost attribution, and access control enforcement. Missing or unapproved labels make it impossible to identify resource ownership, classify medical imaging data sensitivity, and apply organisation-wide security policies consistently. | labels = { environment = "prod", owner = "healthcare-team" } | labels not set (null) or missing required keys environment and owner |
| `notification_config` | A nested object resource. Structure is [documented below](#nested_notification_config). | false | true | Without a Pub/Sub notification configuration, DICOM store operations such as create, update, and delete are not published to any audit stream. This makes it impossible to detect unauthorised access or modifications to medical imaging data in real time. | notification_config block present with a valid pubsub_topic | notification_config block not set (null) — no audit stream for DICOM store operations |
| `stream_configs` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) To enable streaming to BigQuery, configure the streamConfigs object in your DICOM store. streamConfigs is an array, so you can specify multiple BigQuery destinations. You can stream metadata from a single DICOM store to up to five BigQuery tables in a BigQuery dataset. Structure is [documented below](#nested_stream_configs). | false | false | Stream configs define BigQuery export destinations and do not directly affect the security posture of the DICOM store itself. | None | None |
| `bigquery_destination` |  | false | false | The BigQuery destination block defines where DICOM metadata is exported. Security of the exported data is governed by BigQuery IAM controls, not this field directly. | None | None |

### notification_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pubsub_topic` | The Cloud Pub/Sub topic that notifications of changes are published on. Supplied by the client. PubsubMessage.Data will contain the resource name. PubsubMessage.MessageId is the ID of this message. It is guaranteed to be unique within the topic. PubsubMessage.PublishTime is the time at which the message was published. Notifications are only sent if the topic is non-empty. Topic names must be scoped to a project. service-PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com must have publisher permissions on the given Cloud Pub/Sub topic. Not having adequate permissions will cause the calls that send notifications to fail. | true | true | A Pub/Sub topic is required to stream DICOM store events for real-time audit and monitoring. Without it, there is no mechanism to detect or alert on unauthorised creation, modification, or deletion of medical imaging data. | pubsub_topic = "projects/PROJECT/topics/TOPIC" | pubsub_topic not set (null or empty) — no audit notifications published |
| `send_for_bulk_import` | Indicates whether or not to send Pub/Sub notifications on bulk import. Only supported for DICOM imports. | false | false | This field only controls whether bulk import events trigger notifications. The primary security control is the presence of the pubsub_topic itself. | None | None |

### stream_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bigquery_destination` | BigQueryDestination to include a fully qualified BigQuery table URI where DICOM instance metadata will be streamed. Structure is [documented below](#nested_stream_configs_stream_configs_bigquery_destination). | true | false | The BigQuery destination is a required field within stream_configs and defines the export target. Security of the destination is managed at the BigQuery dataset level. | None | None |

### bigquery_destination Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `table_uri` | a fully qualified BigQuery table URI where DICOM instance metadata will be streamed. | true | false | The table_uri is a destination reference only. Security of the target BigQuery table is managed through BigQuery IAM policies. | None | None |
