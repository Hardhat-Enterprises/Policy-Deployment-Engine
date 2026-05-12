## 🛡️ Policy Deployment Engine: `pubsub_topic`

This section provides a concise policy evaluation for the `pubsub_topic` resource in GCP.

Reference: [Terraform Registry – pubsub_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the topic. | true | false | None | None | None |
| `kms_key_name` | The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Your project's PubSub service account (`service-{{PROJECT_NUMBER}}@gcp-sa-pubsub.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. The expected format is `projects/*/locations/*/keyRings/*/cryptoKeys/*` | false | true | Without CMEK, Pub/Sub topics rely on Google-managed encryption. Specifying a customer-managed key gives full control over encryption, supports compliance requirements, and allows key revocation to immediately block data access. | projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key | None (key not set) |
| `labels` | A set of key/value label pairs to assign to this Topic. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `message_storage_policy` | Policy constraining the set of Google Cloud Platform regions where messages published to the topic may be stored. If not present, then no constraints are in effect. Structure is [documented below](#nested_message_storage_policy). | false | false | None | None | None |
| `schema_settings` | Settings for validating messages published against a schema. Structure is [documented below](#nested_schema_settings). | false | false | None | None | None |
| `message_retention_duration` | Indicates the minimum duration to retain a message after it is published to the topic. If this field is set, messages published to the topic in the last messageRetentionDuration are always available to subscribers. For instance, it allows any attached subscription to seek to a timestamp that is up to messageRetentionDuration in the past. If this field is not set, message retention is controlled by settings on individual subscriptions. The rotation period has the format of a decimal number, followed by the letter `s` (seconds). Cannot be more than 31 days or less than 10 minutes. | false | false | None | None | None |
| `ingestion_data_source_settings` | Settings for ingestion from a data source into this topic. Structure is [documented below](#nested_ingestion_data_source_settings). | false | false | None | None | None |
| `message_transforms` | Transforms to be applied to messages published to the topic. Transforms are applied in the order specified. Structure is [documented below](#nested_message_transforms). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `aws_kinesis` |  | false | false | None | None | None |
| `cloud_storage` |  | false | false | None | None | None |
| `text_format` |  | false | false | None | None | None |
| `platform_logs_settings` |  | false | false | None | None | None |
| `azure_event_hubs` |  | false | false | None | None | None |
| `aws_msk` |  | false | false | None | None | None |
| `confluent_cloud` |  | false | false | None | None | None |
| `javascript_udf` |  | false | false | None | None | None |

### message_storage_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_persistence_regions` | A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage. Messages published by publishers running in non-allowed GCP regions (or running outside of GCP altogether) will be routed for storage in one of the allowed regions. An empty list means that no regions are allowed, and is not a valid configuration. | true | false | None | None | None |
| `enforce_in_transit` | If true, `allowedPersistenceRegions` is also used to enforce in-transit guarantees for messages. That is, Pub/Sub will fail topics.publish operations on this topic and subscribe operations on any subscription attached to this topic in any region that is not in `allowedPersistenceRegions`. | false | false | None | None | None |

### schema_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `schema` | The name of the schema that messages published should be validated against. Format is projects/{project}/schemas/{schema}. The value of this field will be _deleted-schema_ if the schema has been deleted. | true | false | None | None | None |
| `encoding` | The encoding of messages validated against schema. Default value is `ENCODING_UNSPECIFIED`. Possible values are: `ENCODING_UNSPECIFIED`, `JSON`, `BINARY`. | false | false | None | None | None |

### ingestion_data_source_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `aws_kinesis` | Settings for ingestion from Amazon Kinesis Data Streams. Structure is [documented below](#nested_ingestion_data_source_settings_aws_kinesis). | false | false | None | None | None |
| `cloud_storage` | Settings for ingestion from Cloud Storage. Structure is [documented below](#nested_ingestion_data_source_settings_cloud_storage). | false | false | None | None | None |
| `platform_logs_settings` | Settings for Platform Logs regarding ingestion to Pub/Sub. If unset, no Platform Logs will be generated.' Structure is [documented below](#nested_ingestion_data_source_settings_platform_logs_settings). | false | false | None | None | None |
| `azure_event_hubs` | Settings for ingestion from Azure Event Hubs. Structure is [documented below](#nested_ingestion_data_source_settings_azure_event_hubs). | false | false | None | None | None |
| `aws_msk` | Settings for ingestion from Amazon Managed Streaming for Apache Kafka. Structure is [documented below](#nested_ingestion_data_source_settings_aws_msk). | false | false | None | None | None |
| `confluent_cloud` | Settings for ingestion from Confluent Cloud. Structure is [documented below](#nested_ingestion_data_source_settings_confluent_cloud). | false | false | None | None | None |

### message_transforms Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `javascript_udf` | Javascript User Defined Function. If multiple Javascript UDFs are specified on a resource, each one must have a unique `function_name`. Structure is [documented below](#nested_message_transforms_message_transforms_javascript_udf). | false | false | None | None | None |
| `disabled` | Controls whether or not to use this transform. If not set or `false`, the transform will be applied to messages. Default: `true`. | false | false | None | None | None |

### aws_kinesis Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `stream_arn` | The Kinesis stream ARN to ingest data from. | true | false | None | None | None |
| `consumer_arn` | The Kinesis consumer ARN to used for ingestion in Enhanced Fan-Out mode. The consumer must be already created and ready to be used. | true | false | None | None | None |
| `aws_role_arn` | AWS role ARN to be used for Federated Identity authentication with Kinesis. Check the Pub/Sub docs for how to set up this role and the required permissions that need to be attached to it. | true | false | None | None | None |
| `gcp_service_account` | The GCP service account to be used for Federated Identity authentication with Kinesis (via a `AssumeRoleWithWebIdentity` call for the provided role). The `awsRoleArn` must be set up with `accounts.google.com:sub` equals to this service account number. | true | false | None | None | None |

### cloud_storage Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | Cloud Storage bucket. The bucket name must be without any prefix like "gs://". See the bucket naming requirements: https://cloud.google.com/storage/docs/buckets#naming. | true | false | None | None | None |
| `text_format` | Configuration for reading Cloud Storage data in text format. Each line of text as specified by the delimiter will be set to the `data` field of a Pub/Sub message. Structure is [documented below](#nested_ingestion_data_source_settings_cloud_storage_text_format). | false | false | None | None | None |
| `avro_format` | Configuration for reading Cloud Storage data in Avro binary format. The bytes of each object will be set to the `data` field of a Pub/Sub message. | false | false | None | None | None |
| `pubsub_avro_format` | Configuration for reading Cloud Storage data written via Cloud Storage subscriptions(See https://cloud.google.com/pubsub/docs/cloudstorage). The data and attributes fields of the originally exported Pub/Sub message will be restored when publishing. | false | false | None | None | None |
| `minimum_object_create_time` | The timestamp set in RFC3339 text format. If set, only objects with a larger or equal timestamp will be ingested. Unset by default, meaning all objects will be ingested. | false | false | None | None | None |
| `match_glob` | Glob pattern used to match objects that will be ingested. If unset, all objects will be ingested. See the supported patterns: https://cloud.google.com/storage/docs/json_api/v1/objects/list#list-objects-and-prefixes-using-glob | false | false | None | None | None |

### text_format Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `delimiter` | The delimiter to use when using the 'text' format. Each line of text as specified by the delimiter will be set to the 'data' field of a Pub/Sub message. When unset, '\n' is used. | false | false | None | None | None |

### platform_logs_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `severity` | The minimum severity level of Platform Logs that will be written. If unspecified, no Platform Logs will be written. Default value is `SEVERITY_UNSPECIFIED`. Possible values are: `SEVERITY_UNSPECIFIED`, `DISABLED`, `DEBUG`, `INFO`, `WARNING`, `ERROR`. | false | false | None | None | None |

### azure_event_hubs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_group` | The name of the resource group within an Azure subscription. | false | false | None | None | None |
| `namespace` | The Azure event hub namespace to ingest data from. | false | false | None | None | None |
| `event_hub` | The Azure event hub to ingest data from. | false | false | None | None | None |
| `client_id` | The Azure event hub client ID to use for ingestion. | false | false | None | None | None |
| `tenant_id` | The Azure event hub tenant ID to use for ingestion. | false | false | None | None | None |
| `subscription_id` | The Azure event hub subscription ID to use for ingestion. | false | false | None | None | None |
| `gcp_service_account` | The GCP service account to be used for Federated Identity authentication with Azure (via a `AssumeRoleWithWebIdentity` call for the provided role). | false | false | None | None | None |

### aws_msk Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_arn` | ARN that uniquely identifies the MSK cluster. | true | false | None | None | None |
| `topic` | The name of the MSK topic that Pub/Sub will import from. | true | false | None | None | None |
| `aws_role_arn` | AWS role ARN to be used for Federated Identity authentication with MSK. Check the Pub/Sub docs for how to set up this role and the required permissions that need to be attached to it. | true | false | None | None | None |
| `gcp_service_account` | The GCP service account to be used for Federated Identity authentication with MSK (via a `AssumeRoleWithWebIdentity` call for the provided role). The `awsRoleArn` must be set up with `accounts.google.com:sub` equals to this service account number. | true | false | None | None | None |

### confluent_cloud Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bootstrap_server` | The Confluent Cloud bootstrap server. The format is url:port. | true | false | None | None | None |
| `cluster_id` | The Confluent Cloud cluster ID. | false | false | None | None | None |
| `topic` | Name of the Confluent Cloud topic that Pub/Sub will import from. | true | false | None | None | None |
| `identity_pool_id` | Identity pool ID to be used for Federated Identity authentication with Confluent Cloud. | true | false | None | None | None |
| `gcp_service_account` | The GCP service account to be used for Federated Identity authentication with Confluent Cloud. | true | false | None | None | None |

### javascript_udf Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `function_name` | Name of the JavaScript function that should be applied to Pub/Sub messages. | true | false | None | None | None |
| `code` | JavaScript code that contains a function `function_name` with the following signature: ``` /** * Transforms a Pub/Sub message. * * @return {(Object<string, (string | Object<string, string>)>|null)} - To * filter a message, return `null`. To transform a message return a map * with the following keys: *   - (required) 'data' : {string} *   - (optional) 'attributes' : {Object<string, string>} * Returning empty `attributes` will remove all attributes from the * message. * * @param  {(Object<string, (string | Object<string, string>)>} Pub/Sub * message. Keys: *   - (required) 'data' : {string} *   - (required) 'attributes' : {Object<string, string>} * * @param  {Object<string, any>} metadata - Pub/Sub message metadata. * Keys: *   - (required) 'message_id'  : {string} *   - (optional) 'publish_time': {string} YYYY-MM-DDTHH:MM:SSZ format *   - (optional) 'ordering_key': {string} */ function <function_name>(message, metadata) { } ``` | true | false | None | None | None |
