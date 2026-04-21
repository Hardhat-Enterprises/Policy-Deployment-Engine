## 🛡️ Policy Deployment Engine: `pubsub_subscription`

This section provides a concise policy evaluation for the `pubsub_subscription` resource in GCP.

Reference: [Terraform Registry – pubsub_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the subscription. | true | false | None | None | None |
| `topic` | A reference to a Topic resource, of the form projects/{project}/topics/{{name}} (as in the id property of a google_pubsub_topic), or just a topic name if the topic is in the same project as the subscription. | true | false | None | None | None |
| `labels` | A set of key/value label pairs to assign to this Subscription. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `bigquery_config` | If delivery to BigQuery is used with this subscription, this field is used to configure it. Either pushConfig, bigQueryConfig or cloudStorageConfig can be set, but not combined. If all three are empty, then the subscriber will pull and ack messages using API methods. Structure is [documented below](#nested_bigquery_config). | false | false | None | None | None |
| `cloud_storage_config` | If delivery to Cloud Storage is used with this subscription, this field is used to configure it. Either pushConfig, bigQueryConfig or cloudStorageConfig can be set, but not combined. If all three are empty, then the subscriber will pull and ack messages using API methods. Structure is [documented below](#nested_cloud_storage_config). | false | false | None | None | None |
| `push_config` | If push delivery is used with this subscription, this field is used to configure it. An empty pushConfig signifies that the subscriber will pull and ack messages using API methods. Structure is [documented below](#nested_push_config). | false | false | None | None | None |
| `ack_deadline_seconds` | This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. After message delivery but before the ack deadline expires and before the message is acknowledged, it is an outstanding message and will not be delivered again during that time (on a best-effort basis). For pull subscriptions, this value is used as the initial value for the ack deadline. To override this value for a given message, call subscriptions.modifyAckDeadline with the corresponding ackId if using pull. The minimum custom deadline you can specify is 10 seconds. The maximum custom deadline you can specify is 600 seconds (10 minutes). If this parameter is 0, a default value of 10 seconds is used. For push delivery, this value is also used to set the request timeout for the call to the push endpoint. If the subscriber never acknowledges the message, the Pub/Sub system will eventually redeliver the message. | false | false | None | None | None |
| `message_retention_duration` | How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retain_acked_messages is true, then this also configures the retention of acknowledged messages, and thus configures how far back in time a subscriptions.seek can be done. Defaults to 7 days. Cannot be more than 31 days (`"2678400s"`) or less than 10 minutes (`"600s"`). A duration in seconds with up to nine fractional digits, terminated by 's'. Example: `"600.5s"`. | false | false | None | None | None |
| `retain_acked_messages` | Indicates whether to retain acknowledged messages. If `true`, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window. | false | false | None | None | None |
| `expiration_policy` | A policy that specifies the conditions for this subscription's expiration. A subscription is considered active as long as any connected subscriber is successfully consuming messages from the subscription or is issuing operations on the subscription. If expirationPolicy is not set, a default policy with ttl of 31 days will be used.  If it is set but ttl is "", the resource never expires.  The minimum allowed value for expirationPolicy.ttl is 1 day. Structure is [documented below](#nested_expiration_policy). | false | false | None | None | None |
| `filter` | The subscription only delivers the messages that match the filter. Pub/Sub automatically acknowledges the messages that don't match the filter. You can filter messages by their attributes. The maximum length of a filter is 256 bytes. After creating the subscription, you can't modify the filter. | false | false | None | None | None |
| `dead_letter_policy` | A policy that specifies the conditions for dead lettering messages in this subscription. If dead_letter_policy is not set, dead lettering is disabled. The Cloud Pub/Sub service account associated with this subscription's parent project (i.e., service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have permission to Acknowledge() messages on this subscription. Structure is [documented below](#nested_dead_letter_policy). | false | false | None | None | None |
| `retry_policy` | A policy that specifies how Pub/Sub retries message delivery for this subscription. If not set, the default retry policy is applied. This generally implies that messages will be retried as soon as possible for healthy subscribers. RetryPolicy will be triggered on NACKs or acknowledgement deadline exceeded events for a given message Structure is [documented below](#nested_retry_policy). | false | false | None | None | None |
| `enable_message_ordering` | If `true`, messages published with the same orderingKey in PubsubMessage will be delivered to the subscribers in the order in which they are received by the Pub/Sub system. Otherwise, they may be delivered in any order. | false | false | None | None | None |
| `enable_exactly_once_delivery` | If `true`, Pub/Sub provides the following guarantees for the delivery of a message with a given value of messageId on this Subscriptions': - The message sent to a subscriber is guaranteed not to be resent before the message's acknowledgement deadline expires. - An acknowledged message will not be resent to a subscriber. Note that subscribers may still receive multiple copies of a message when `enable_exactly_once_delivery` is true if the message was published multiple times by a publisher client. These copies are considered distinct by Pub/Sub and have distinct messageId values | false | true | Without exactly-once delivery, subscribers may process duplicate messages, leading to data integrity issues, double-charging, or inconsistent state. Enabling this setting eliminates replay attacks on the message layer and ensures reliable downstream processing. | true | false |
| `message_transforms` | Transforms to be applied to messages published to the topic. Transforms are applied in the order specified. Structure is [documented below](#nested_message_transforms). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `avro_config` |  | false | false | None | None | None |
| `oidc_token` |  | false | false | None | None | None |
| `no_wrapper` |  | false | false | None | None | None |
| `javascript_udf` |  | false | false | None | None | None |

### bigquery_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `table` | The name of the table to which to write data, of the form {projectId}.{datasetId}.{tableId} | true | false | None | None | None |
| `use_topic_schema` | When true, use the topic's schema as the columns to write to in BigQuery, if it exists. Only one of use_topic_schema and use_table_schema can be set. | false | false | None | None | None |
| `use_table_schema` | When true, use the BigQuery table's schema as the columns to write to in BigQuery. Messages must be published in JSON format. Only one of use_topic_schema and use_table_schema can be set. | false | false | None | None | None |
| `write_metadata` | When true, write the subscription name, messageId, publishTime, attributes, and orderingKey to additional columns in the table. The subscription name, messageId, and publishTime fields are put in their own columns while all other message properties (other than data) are written to a JSON object in the attributes column. | false | false | None | None | None |
| `drop_unknown_fields` | When true and use_topic_schema or use_table_schema is true, any fields that are a part of the topic schema or message schema that are not part of the BigQuery table schema are dropped when writing to BigQuery. Otherwise, the schemas must be kept in sync and any messages with extra fields are not written and remain in the subscription's backlog. | false | false | None | None | None |
| `service_account_email` | The service account to use to write to BigQuery. If not specified, the Pub/Sub [service agent](https://cloud.google.com/iam/docs/service-agents), service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com, is used. | false | false | None | None | None |

### cloud_storage_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | User-provided name for the Cloud Storage bucket. The bucket must be created by the user. The bucket name must be without any prefix like "gs://". | true | false | None | None | None |
| `filename_prefix` | User-provided prefix for Cloud Storage filename. | false | false | None | None | None |
| `filename_suffix` | User-provided suffix for Cloud Storage filename. Must not end in "/". | false | false | None | None | None |
| `filename_datetime_format` | User-provided format string specifying how to represent datetimes in Cloud Storage filenames. | false | false | None | None | None |
| `max_duration` | The maximum duration that can elapse before a new Cloud Storage file is created. Min 1 minute, max 10 minutes, default 5 minutes. May not exceed the subscription's acknowledgement deadline. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | None | None | None |
| `max_bytes` | The maximum bytes that can be written to a Cloud Storage file before a new file is created. Min 1 KB, max 10 GiB. The maxBytes limit may be exceeded in cases where messages are larger than the limit. | false | false | None | None | None |
| `max_messages` | The maximum messages that can be written to a Cloud Storage file before a new file is created. Min 1000 messages. | false | false | None | None | None |
| `state` | (Output) An output-only field that indicates whether or not the subscription can receive messages. | false | false | None | None | None |
| `avro_config` | If set, message data will be written to Cloud Storage in Avro format. Structure is [documented below](#nested_cloud_storage_config_avro_config). | false | false | None | None | None |
| `service_account_email` | The service account to use to write to Cloud Storage. If not specified, the Pub/Sub [service agent](https://cloud.google.com/iam/docs/service-agents), service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com, is used. | false | false | None | None | None |

### push_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `oidc_token` | If specified, Pub/Sub will generate and attach an OIDC JWT token as an Authorization header in the HTTP request for every pushed message. Structure is [documented below](#nested_push_config_oidc_token). | false | false | None | None | None |
| `push_endpoint` | A URL locating the endpoint to which messages should be pushed. For example, a Webhook endpoint might use "https://example.com/push". | true | false | None | None | None |
| `attributes` | Endpoint configuration attributes. Every endpoint has a set of API supported attributes that can be used to control different aspects of the message delivery. The currently supported attribute is x-goog-version, which you can use to change the format of the pushed message. This attribute indicates the version of the data expected by the endpoint. This controls the shape of the pushed message (i.e., its fields and metadata). The endpoint version is based on the version of the Pub/Sub API. If not present during the subscriptions.create call, it will default to the version of the API used to make such call. If not present during a subscriptions.modifyPushConfig call, its value will not be changed. subscriptions.get calls will always return a valid version, even if the subscription was created without this attribute. The possible values for this attribute are: - v1beta1: uses the push format defined in the v1beta1 Pub/Sub API. - v1 or v1beta2: uses the push format defined in the v1 Pub/Sub API. | false | false | None | None | None |
| `no_wrapper` | When set, the payload to the push endpoint is not wrapped.Sets the `data` field as the HTTP body for delivery. Structure is [documented below](#nested_push_config_no_wrapper). | false | false | None | None | None |

### expiration_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ttl` | Specifies the "time-to-live" duration for an associated resource. The resource expires if it is not active for a period of ttl. If ttl is set to "", the associated resource never expires. A duration in seconds with up to nine fractional digits, terminated by 's'. Example - "3.5s". | true | false | None | None | None |

### dead_letter_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dead_letter_topic` | The name of the topic to which dead letter messages should be published. Format is `projects/{project}/topics/{topic}`. The Cloud Pub/Sub service account associated with the enclosing subscription's parent project (i.e., service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have permission to Publish() to this topic. The operation will fail if the topic does not exist. Users should ensure that there is a subscription attached to this topic since messages published to a topic with no subscriptions are lost. | false | false | None | None | None |
| `max_delivery_attempts` | The maximum number of delivery attempts for any message. The value must be between 5 and 100. The number of delivery attempts is defined as 1 + (the sum of number of NACKs and number of times the acknowledgement deadline has been exceeded for the message). A NACK is any call to ModifyAckDeadline with a 0 deadline. Note that client libraries may automatically extend ack_deadlines. This field will be honored on a best effort basis. If this parameter is 0, a default value of 5 is used. | false | false | None | None | None |

### retry_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `minimum_backoff` | The minimum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Defaults to 10 seconds. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `maximum_backoff` | The maximum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Defaults to 600 seconds. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |

### message_transforms Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `javascript_udf` | Javascript User Defined Function. If multiple Javascript UDFs are specified on a resource, each one must have a unique `function_name`. Structure is [documented below](#nested_message_transforms_message_transforms_javascript_udf). | false | false | None | None | None |
| `disabled` | Controls whether or not to use this transform. If not set or `false`, the transform will be applied to messages. Default: `true`. | false | false | None | None | None |

### avro_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `write_metadata` | When true, write the subscription name, messageId, publishTime, attributes, and orderingKey as additional fields in the output. | false | false | None | None | None |
| `use_topic_schema` | When true, the output Cloud Storage file will be serialized using the topic schema, if it exists. | false | false | None | None | None |

### oidc_token Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_email` | Service account email to be used for generating the OIDC token. The caller (for subscriptions.create, subscriptions.patch, and subscriptions.modifyPushConfig RPCs) must have the iam.serviceAccounts.actAs permission for the service account. | true | false | None | None | None |
| `audience` | Audience to be used when generating OIDC token. The audience claim identifies the recipients that the JWT is intended for. The audience value is a single case-sensitive string. Having multiple values (array) for the audience field is not supported. More info about the OIDC JWT token audience here: https://tools.ietf.org/html/rfc7519#section-4.1.3 Note: if not specified, the Push endpoint URL will be used. | false | false | None | None | None |

### no_wrapper Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `write_metadata` | When true, writes the Pub/Sub message metadata to `x-goog-pubsub-<KEY>:<VAL>` headers of the HTTP request. Writes the Pub/Sub message attributes to `<KEY>:<VAL>` headers of the HTTP request. | true | false | None | None | None |

### javascript_udf Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `function_name` | Name of the JavaScript function that should be applied to Pub/Sub messages. | true | false | None | None | None |
| `code` | JavaScript code that contains a function `function_name` with the following signature: ``` /** * Transforms a Pub/Sub message. * * @return {(Object<string, (string | Object<string, string>)>|null)} - To * filter a message, return `null`. To transform a message return a map * with the following keys: *   - (required) 'data' : {string} *   - (optional) 'attributes' : {Object<string, string>} * Returning empty `attributes` will remove all attributes from the * message. * * @param  {(Object<string, (string | Object<string, string>)>} Pub/Sub * message. Keys: *   - (required) 'data' : {string} *   - (required) 'attributes' : {Object<string, string>} * * @param  {Object<string, any>} metadata - Pub/Sub message metadata. * Keys: *   - (required) 'message_id'  : {string} *   - (optional) 'publish_time': {string} YYYY-MM-DDTHH:MM:SSZ format *   - (optional) 'ordering_key': {string} */ function <function_name>(message, metadata) { } ``` | true | false | None | None | None |
