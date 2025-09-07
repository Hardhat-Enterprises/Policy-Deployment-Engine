## 🛡️ Policy Deployment Engine: `pubsub_topic`

This section provides a concise policy evaluation for the `pubsub_topic` resource in GCP.

Reference: [Terraform Registry – pubsub_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Your project's PubSub service account (`service-{{PROJECT_NUMBER}}@gcp-sa-pubsub.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. The expected format is `projects/*/locations/*/keyRings/*/cryptoKeys/*`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs to assign to this Topic. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_storage_policy`
- Description: (Optional) Policy constraining the set of Google Cloud Platform regions where messages published to the topic may be stored. If not present, then no constraints are in effect. Structure is [documented below](#nested_message_storage_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_settings`
- Description: (Optional) Settings for validating messages published against a schema. Structure is [documented below](#nested_schema_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_retention_duration`
- Description: (Optional) Indicates the minimum duration to retain a message after it is published to the topic. If this field is set, messages published to the topic in the last messageRetentionDuration are always available to subscribers. For instance, it allows any attached subscription to seek to a timestamp that is up to messageRetentionDuration in the past. If this field is not set, message retention is controlled by settings on individual subscriptions. The rotation period has the format of a decimal number, followed by the letter `s` (seconds). Cannot be more than 31 days or less than 10 minutes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_data_source_settings`
- Description: (Optional) Settings for ingestion from a data source into this topic. Structure is [documented below](#nested_ingestion_data_source_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_transforms`
- Description: (Optional) Transforms to be applied to messages published to the topic. Transforms are applied in the order specified. Structure is [documented below](#nested_message_transforms).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_message_storage_policy"></a>The `message_storage_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_persistence_regions`
- Description: (Required) A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage. Messages published by publishers running in non-allowed GCP regions (or running outside of GCP altogether) will be routed for storage in one of the allowed regions. An empty list means that no regions are allowed, and is not a valid configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_in_transit`
- Description: (Optional) If true, `allowedPersistenceRegions` is also used to enforce in-transit guarantees for messages. That is, Pub/Sub will fail topics.publish operations on this topic and subscribe operations on any subscription attached to this topic in any region that is not in `allowedPersistenceRegions`. <a name="nested_schema_settings"></a>The `schema_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) The name of the schema that messages published should be validated against. Format is projects/{project}/schemas/{schema}. The value of this field will be _deleted-schema_ if the schema has been deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Optional) The encoding of messages validated against schema. Default value is `ENCODING_UNSPECIFIED`. Possible values are: `ENCODING_UNSPECIFIED`, `JSON`, `BINARY`. <a name="nested_ingestion_data_source_settings"></a>The `ingestion_data_source_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_kinesis`
- Description: (Optional) Settings for ingestion from Amazon Kinesis Data Streams. Structure is [documented below](#nested_ingestion_data_source_settings_aws_kinesis).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage`
- Description: (Optional) Settings for ingestion from Cloud Storage. Structure is [documented below](#nested_ingestion_data_source_settings_cloud_storage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform_logs_settings`
- Description: (Optional) Settings for Platform Logs regarding ingestion to Pub/Sub. If unset, no Platform Logs will be generated.' Structure is [documented below](#nested_ingestion_data_source_settings_platform_logs_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure_event_hubs`
- Description: (Optional) Settings for ingestion from Azure Event Hubs. Structure is [documented below](#nested_ingestion_data_source_settings_azure_event_hubs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_msk`
- Description: (Optional) Settings for ingestion from Amazon Managed Streaming for Apache Kafka. Structure is [documented below](#nested_ingestion_data_source_settings_aws_msk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confluent_cloud`
- Description: (Optional) Settings for ingestion from Confluent Cloud. Structure is [documented below](#nested_ingestion_data_source_settings_confluent_cloud). <a name="nested_ingestion_data_source_settings_aws_kinesis"></a>The `aws_kinesis` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stream_arn`
- Description: (Required) The Kinesis stream ARN to ingest data from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_arn`
- Description: (Required) The Kinesis consumer ARN to used for ingestion in Enhanced Fan-Out mode. The consumer must be already created and ready to be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_role_arn`
- Description: (Required) AWS role ARN to be used for Federated Identity authentication with Kinesis. Check the Pub/Sub docs for how to set up this role and the required permissions that need to be attached to it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account`
- Description: (Required) The GCP service account to be used for Federated Identity authentication with Kinesis (via a `AssumeRoleWithWebIdentity` call for the provided role). The `awsRoleArn` must be set up with `accounts.google.com:sub` equals to this service account number. <a name="nested_ingestion_data_source_settings_cloud_storage"></a>The `cloud_storage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Cloud Storage bucket. The bucket name must be without any prefix like "gs://". See the bucket naming requirements: https://cloud.google.com/storage/docs/buckets#naming.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text_format`
- Description: (Optional) Configuration for reading Cloud Storage data in text format. Each line of text as specified by the delimiter will be set to the `data` field of a Pub/Sub message. Structure is [documented below](#nested_ingestion_data_source_settings_cloud_storage_text_format).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `avro_format`
- Description: (Optional) Configuration for reading Cloud Storage data in Avro binary format. The bytes of each object will be set to the `data` field of a Pub/Sub message.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_avro_format`
- Description: (Optional) Configuration for reading Cloud Storage data written via Cloud Storage subscriptions(See https://cloud.google.com/pubsub/docs/cloudstorage). The data and attributes fields of the originally exported Pub/Sub message will be restored when publishing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_object_create_time`
- Description: (Optional) The timestamp set in RFC3339 text format. If set, only objects with a larger or equal timestamp will be ingested. Unset by default, meaning all objects will be ingested.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_glob`
- Description: (Optional) Glob pattern used to match objects that will be ingested. If unset, all objects will be ingested. See the supported patterns: https://cloud.google.com/storage/docs/json_api/v1/objects/list#list-objects-and-prefixes-using-glob <a name="nested_ingestion_data_source_settings_cloud_storage_text_format"></a>The `text_format` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delimiter`
- Description: (Optional) The delimiter to use when using the 'text' format. Each line of text as specified by the delimiter will be set to the 'data' field of a Pub/Sub message. When unset, '\n' is used. <a name="nested_ingestion_data_source_settings_platform_logs_settings"></a>The `platform_logs_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `severity`
- Description: (Optional) The minimum severity level of Platform Logs that will be written. If unspecified, no Platform Logs will be written. Default value is `SEVERITY_UNSPECIFIED`. Possible values are: `SEVERITY_UNSPECIFIED`, `DISABLED`, `DEBUG`, `INFO`, `WARNING`, `ERROR`. <a name="nested_ingestion_data_source_settings_azure_event_hubs"></a>The `azure_event_hubs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) The name of the resource group within an Azure subscription.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Optional) The Azure event hub namespace to ingest data from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_hub`
- Description: (Optional) The Azure event hub to ingest data from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) The Azure event hub client ID to use for ingestion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tenant_id`
- Description: (Optional) The Azure event hub tenant ID to use for ingestion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscription_id`
- Description: (Optional) The Azure event hub subscription ID to use for ingestion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account`
- Description: (Optional) The GCP service account to be used for Federated Identity authentication with Azure (via a `AssumeRoleWithWebIdentity` call for the provided role). <a name="nested_ingestion_data_source_settings_aws_msk"></a>The `aws_msk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_arn`
- Description: (Required) ARN that uniquely identifies the MSK cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) The name of the MSK topic that Pub/Sub will import from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_role_arn`
- Description: (Required) AWS role ARN to be used for Federated Identity authentication with MSK. Check the Pub/Sub docs for how to set up this role and the required permissions that need to be attached to it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account`
- Description: (Required) The GCP service account to be used for Federated Identity authentication with MSK (via a `AssumeRoleWithWebIdentity` call for the provided role). The `awsRoleArn` must be set up with `accounts.google.com:sub` equals to this service account number. <a name="nested_ingestion_data_source_settings_confluent_cloud"></a>The `confluent_cloud` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bootstrap_server`
- Description: (Required) The Confluent Cloud bootstrap server. The format is url:port.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_id`
- Description: (Optional) The Confluent Cloud cluster ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) Name of the Confluent Cloud topic that Pub/Sub will import from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity_pool_id`
- Description: (Required) Identity pool ID to be used for Federated Identity authentication with Confluent Cloud.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account`
- Description: (Required) The GCP service account to be used for Federated Identity authentication with Confluent Cloud. <a name="nested_message_transforms"></a>The `message_transforms` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `javascript_udf`
- Description: (Optional) Javascript User Defined Function. If multiple Javascript UDFs are specified on a resource, each one must have a unique `function_name`. Structure is [documented below](#nested_message_transforms_message_transforms_javascript_udf).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Controls whether or not to use this transform. If not set or `false`, the transform will be applied to messages. Default: `true`. <a name="nested_message_transforms_message_transforms_javascript_udf"></a>The `javascript_udf` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `function_name`
- Description: (Required) Name of the JavaScript function that should be applied to Pub/Sub messages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code`
- Description: (Required) JavaScript code that contains a function `function_name` with the following signature: ``` /** * Transforms a Pub/Sub message. * * @return {(Object<string, (string | Object<string, string>)>|null)} - To * filter a message, return `null`. To transform a message return a map * with the following keys: *   - (required) 'data' : {string} *   - (optional) 'attributes' : {Object<string, string>} * Returning empty `attributes` will remove all attributes from the * message. * * @param  {(Object<string, (string | Object<string, string>)>} Pub/Sub * message. Keys: *   - (required) 'data' : {string} *   - (required) 'attributes' : {Object<string, string>} * * @param  {Object<string, any>} metadata - Pub/Sub message metadata. * Keys: *   - (required) 'message_id'  : {string} *   - (optional) 'publish_time': {string} YYYY-MM-DDTHH:MM:SSZ format *   - (optional) 'ordering_key': {string} */ function <function_name>(message, metadata) { } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
