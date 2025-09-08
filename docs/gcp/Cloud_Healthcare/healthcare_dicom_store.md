## 🛡️ Policy Deployment Engine: `healthcare_dicom_store`

This section provides a concise policy evaluation for the `healthcare_dicom_store` resource in GCP.

Reference: [Terraform Registry – healthcare_dicom_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dicom_store)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for the DicomStore. ** Changing this property may recreate the Dicom store (removing all data) ** | true | None | None |
| `dataset` | Identifies the dataset addressed by this request. Must be in the format 'projects/{project}/locations/{location}/datasets/{dataset}' | true | None | None |
| `labels` | User-supplied key-value pairs used to organize DICOM stores. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values are optional, must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be associated with a given store. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |

### notification_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pubsub_topic` | The Cloud Pub/Sub topic that notifications of changes are published on. Supplied by the client. PubsubMessage.Data will contain the resource name. PubsubMessage.MessageId is the ID of this message. It is guaranteed to be unique within the topic. PubsubMessage.PublishTime is the time at which the message was published. Notifications are only sent if the topic is non-empty. Topic names must be scoped to a project. service-PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com must have publisher permissions on the given Cloud Pub/Sub topic. Not having adequate permissions will cause the calls that send notifications to fail. | true | None | None |
| `send_for_bulk_import` | Indicates whether or not to send Pub/Sub notifications on bulk import. Only supported for DICOM imports. | false | None | None |

### stream_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bigquery_destination` | BigQueryDestination to include a fully qualified BigQuery table URI where DICOM instance metadata will be streamed. Structure is [documented below](#nested_stream_configs_stream_configs_bigquery_destination). | true | None | None |

### bigquery_destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table_uri` | a fully qualified BigQuery table URI where DICOM instance metadata will be streamed. | true | None | None |
