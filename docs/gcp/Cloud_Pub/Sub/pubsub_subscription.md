## 🛡️ Policy Deployment Engine: `pubsub_subscription`

This section provides a concise policy evaluation for the `pubsub_subscription` resource in GCP.

Reference: [Terraform Registry – pubsub_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the subscription.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) A reference to a Topic resource, of the form projects/{project}/topics/{{name}} (as in the id property of a google_pubsub_topic), or just a topic name if the topic is in the same project as the subscription.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs to assign to this Subscription. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_config`
- Description: (Optional) If delivery to BigQuery is used with this subscription, this field is used to configure it. Either pushConfig, bigQueryConfig or cloudStorageConfig can be set, but not combined. If all three are empty, then the subscriber will pull and ack messages using API methods. Structure is [documented below](#nested_bigquery_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_config`
- Description: (Optional) If delivery to Cloud Storage is used with this subscription, this field is used to configure it. Either pushConfig, bigQueryConfig or cloudStorageConfig can be set, but not combined. If all three are empty, then the subscriber will pull and ack messages using API methods. Structure is [documented below](#nested_cloud_storage_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `push_config`
- Description: (Optional) If push delivery is used with this subscription, this field is used to configure it. An empty pushConfig signifies that the subscriber will pull and ack messages using API methods. Structure is [documented below](#nested_push_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ack_deadline_seconds`
- Description: (Optional) This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. After message delivery but before the ack deadline expires and before the message is acknowledged, it is an outstanding message and will not be delivered again during that time (on a best-effort basis). For pull subscriptions, this value is used as the initial value for the ack deadline. To override this value for a given message, call subscriptions.modifyAckDeadline with the corresponding ackId if using pull. The minimum custom deadline you can specify is 10 seconds. The maximum custom deadline you can specify is 600 seconds (10 minutes). If this parameter is 0, a default value of 10 seconds is used. For push delivery, this value is also used to set the request timeout for the call to the push endpoint. If the subscriber never acknowledges the message, the Pub/Sub system will eventually redeliver the message.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_retention_duration`
- Description: (Optional) How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retain_acked_messages is true, then this also configures the retention of acknowledged messages, and thus configures how far back in time a subscriptions.seek can be done. Defaults to 7 days. Cannot be more than 31 days (`"2678400s"`) or less than 10 minutes (`"600s"`). A duration in seconds with up to nine fractional digits, terminated by 's'. Example: `"600.5s"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retain_acked_messages`
- Description: (Optional) Indicates whether to retain acknowledged messages. If `true`, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_policy`
- Description: (Optional) A policy that specifies the conditions for this subscription's expiration. A subscription is considered active as long as any connected subscriber is successfully consuming messages from the subscription or is issuing operations on the subscription. If expirationPolicy is not set, a default policy with ttl of 31 days will be used.  If it is set but ttl is "", the resource never expires.  The minimum allowed value for expirationPolicy.ttl is 1 day. Structure is [documented below](#nested_expiration_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) The subscription only delivers the messages that match the filter. Pub/Sub automatically acknowledges the messages that don't match the filter. You can filter messages by their attributes. The maximum length of a filter is 256 bytes. After creating the subscription, you can't modify the filter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dead_letter_policy`
- Description: (Optional) A policy that specifies the conditions for dead lettering messages in this subscription. If dead_letter_policy is not set, dead lettering is disabled. The Cloud Pub/Sub service account associated with this subscription's parent project (i.e., service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have permission to Acknowledge() messages on this subscription. Structure is [documented below](#nested_dead_letter_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) A policy that specifies how Pub/Sub retries message delivery for this subscription. If not set, the default retry policy is applied. This generally implies that messages will be retried as soon as possible for healthy subscribers. RetryPolicy will be triggered on NACKs or acknowledgement deadline exceeded events for a given message Structure is [documented below](#nested_retry_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_message_ordering`
- Description: (Optional) If `true`, messages published with the same orderingKey in PubsubMessage will be delivered to the subscribers in the order in which they are received by the Pub/Sub system. Otherwise, they may be delivered in any order.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_exactly_once_delivery`
- Description: (Optional) If `true`, Pub/Sub provides the following guarantees for the delivery of a message with a given value of messageId on this Subscriptions': - The message sent to a subscriber is guaranteed not to be resent before the message's acknowledgement deadline expires. - An acknowledged message will not be resent to a subscriber. Note that subscribers may still receive multiple copies of a message when `enable_exactly_once_delivery` is true if the message was published multiple times by a publisher client. These copies are considered distinct by Pub/Sub and have distinct messageId values
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_transforms`
- Description: (Optional) Transforms to be applied to messages published to the topic. Transforms are applied in the order specified. Structure is [documented below](#nested_message_transforms).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_bigquery_config"></a>The `bigquery_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) The name of the table to which to write data, of the form {projectId}.{datasetId}.{tableId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_topic_schema`
- Description: (Optional) When true, use the topic's schema as the columns to write to in BigQuery, if it exists. Only one of use_topic_schema and use_table_schema can be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_table_schema`
- Description: (Optional) When true, use the BigQuery table's schema as the columns to write to in BigQuery. Messages must be published in JSON format. Only one of use_topic_schema and use_table_schema can be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `write_metadata`
- Description: (Optional) When true, write the subscription name, messageId, publishTime, attributes, and orderingKey to additional columns in the table. The subscription name, messageId, and publishTime fields are put in their own columns while all other message properties (other than data) are written to a JSON object in the attributes column.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `drop_unknown_fields`
- Description: (Optional) When true and use_topic_schema or use_table_schema is true, any fields that are a part of the topic schema or message schema that are not part of the BigQuery table schema are dropped when writing to BigQuery. Otherwise, the schemas must be kept in sync and any messages with extra fields are not written and remain in the subscription's backlog.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) The service account to use to write to BigQuery. If not specified, the Pub/Sub [service agent](https://cloud.google.com/iam/docs/service-agents), service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com, is used. <a name="nested_cloud_storage_config"></a>The `cloud_storage_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) User-provided name for the Cloud Storage bucket. The bucket must be created by the user. The bucket name must be without any prefix like "gs://".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filename_prefix`
- Description: (Optional) User-provided prefix for Cloud Storage filename.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filename_suffix`
- Description: (Optional) User-provided suffix for Cloud Storage filename. Must not end in "/".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filename_datetime_format`
- Description: (Optional) User-provided format string specifying how to represent datetimes in Cloud Storage filenames.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_duration`
- Description: (Optional) The maximum duration that can elapse before a new Cloud Storage file is created. Min 1 minute, max 10 minutes, default 5 minutes. May not exceed the subscription's acknowledgement deadline. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_bytes`
- Description: (Optional) The maximum bytes that can be written to a Cloud Storage file before a new file is created. Min 1 KB, max 10 GiB. The maxBytes limit may be exceeded in cases where messages are larger than the limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_messages`
- Description: (Optional) The maximum messages that can be written to a Cloud Storage file before a new file is created. Min 1000 messages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) An output-only field that indicates whether or not the subscription can receive messages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `avro_config`
- Description: (Optional) If set, message data will be written to Cloud Storage in Avro format. Structure is [documented below](#nested_cloud_storage_config_avro_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) The service account to use to write to Cloud Storage. If not specified, the Pub/Sub [service agent](https://cloud.google.com/iam/docs/service-agents), service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com, is used. <a name="nested_cloud_storage_config_avro_config"></a>The `avro_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `write_metadata`
- Description: (Optional) When true, write the subscription name, messageId, publishTime, attributes, and orderingKey as additional fields in the output.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_topic_schema`
- Description: (Optional) When true, the output Cloud Storage file will be serialized using the topic schema, if it exists. <a name="nested_push_config"></a>The `push_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc_token`
- Description: (Optional) If specified, Pub/Sub will generate and attach an OIDC JWT token as an Authorization header in the HTTP request for every pushed message. Structure is [documented below](#nested_push_config_oidc_token).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `push_endpoint`
- Description: (Required) A URL locating the endpoint to which messages should be pushed. For example, a Webhook endpoint might use "https://example.com/push".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Endpoint configuration attributes. Every endpoint has a set of API supported attributes that can be used to control different aspects of the message delivery. The currently supported attribute is x-goog-version, which you can use to change the format of the pushed message. This attribute indicates the version of the data expected by the endpoint. This controls the shape of the pushed message (i.e., its fields and metadata). The endpoint version is based on the version of the Pub/Sub API. If not present during the subscriptions.create call, it will default to the version of the API used to make such call. If not present during a subscriptions.modifyPushConfig call, its value will not be changed. subscriptions.get calls will always return a valid version, even if the subscription was created without this attribute. The possible values for this attribute are: - v1beta1: uses the push format defined in the v1beta1 Pub/Sub API. - v1 or v1beta2: uses the push format defined in the v1 Pub/Sub API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_wrapper`
- Description: (Optional) When set, the payload to the push endpoint is not wrapped.Sets the `data` field as the HTTP body for delivery. Structure is [documented below](#nested_push_config_no_wrapper). <a name="nested_push_config_oidc_token"></a>The `oidc_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Required) Service account email to be used for generating the OIDC token. The caller (for subscriptions.create, subscriptions.patch, and subscriptions.modifyPushConfig RPCs) must have the iam.serviceAccounts.actAs permission for the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audience`
- Description: (Optional) Audience to be used when generating OIDC token. The audience claim identifies the recipients that the JWT is intended for. The audience value is a single case-sensitive string. Having multiple values (array) for the audience field is not supported. More info about the OIDC JWT token audience here: https://tools.ietf.org/html/rfc7519#section-4.1.3 Note: if not specified, the Push endpoint URL will be used. <a name="nested_push_config_no_wrapper"></a>The `no_wrapper` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `write_metadata`
- Description: (Required) When true, writes the Pub/Sub message metadata to `x-goog-pubsub-<KEY>:<VAL>` headers of the HTTP request. Writes the Pub/Sub message attributes to `<KEY>:<VAL>` headers of the HTTP request. <a name="nested_expiration_policy"></a>The `expiration_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Required) Specifies the "time-to-live" duration for an associated resource. The resource expires if it is not active for a period of ttl. If ttl is set to "", the associated resource never expires. A duration in seconds with up to nine fractional digits, terminated by 's'. Example - "3.5s". <a name="nested_dead_letter_policy"></a>The `dead_letter_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dead_letter_topic`
- Description: (Optional) The name of the topic to which dead letter messages should be published. Format is `projects/{project}/topics/{topic}`. The Cloud Pub/Sub service account associated with the enclosing subscription's parent project (i.e., service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have permission to Publish() to this topic. The operation will fail if the topic does not exist. Users should ensure that there is a subscription attached to this topic since messages published to a topic with no subscriptions are lost.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_delivery_attempts`
- Description: (Optional) The maximum number of delivery attempts for any message. The value must be between 5 and 100. The number of delivery attempts is defined as 1 + (the sum of number of NACKs and number of times the acknowledgement deadline has been exceeded for the message). A NACK is any call to ModifyAckDeadline with a 0 deadline. Note that client libraries may automatically extend ack_deadlines. This field will be honored on a best effort basis. If this parameter is 0, a default value of 5 is used. <a name="nested_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_backoff`
- Description: (Optional) The minimum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Defaults to 10 seconds. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum_backoff`
- Description: (Optional) The maximum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Defaults to 600 seconds. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". <a name="nested_message_transforms"></a>The `message_transforms` block supports:
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
