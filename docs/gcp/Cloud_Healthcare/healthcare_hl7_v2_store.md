## 🛡️ Policy Deployment Engine: `healthcare_hl7_v2_store`

This section provides a concise policy evaluation for the `healthcare_hl7_v2_store` resource in GCP.

Reference: [Terraform Registry – healthcare_hl7_v2_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_hl7_v2_store)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name for the Hl7V2Store. ** Changing this property may recreate the Hl7v2 store (removing all data) **
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) Identifies the dataset addressed by this request. Must be in the format 'projects/{project}/locations/{location}/datasets/{dataset}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reject_duplicate_message`
- Description: (Optional) Determines whether duplicate messages are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parser_config`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_parser_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-supplied key-value pairs used to organize HL7v2 stores. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values are optional, must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be associated with a given store. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_configs`
- Description: (Optional) A list of notification configs. Each configuration uses a filter to determine whether to publish a message (both Ingest & Create) on the corresponding notification destination. Only the message name is sent as part of the notification. Supplied by the client. Structure is [documented below](#nested_notification_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_config`
- Description: (Optional, Deprecated) A nested object resource. Structure is [documented below](#nested_notification_config). ~> **Warning:** `notification_config` is deprecated and will be removed in a future major release. Use `notification_configs` instead. <a name="nested_parser_config"></a>The `parser_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_null_header`
- Description: (Optional) Determines whether messages with no header are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `segment_terminator`
- Description: (Optional) Byte(s) to be used as the segment terminator. If this is unset, '\r' will be used as segment terminator. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Optional) JSON encoded string for schemas used to parse messages in this store if schematized parsing is desired.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The version of the unschematized parser to be used when a custom `schema` is not set. Default value is `V1`. Possible values are: `V1`, `V2`, `V3`. <a name="nested_notification_configs"></a>The `notification_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_topic`
- Description: (Required) The Cloud Pub/Sub topic that notifications of changes are published on. Supplied by the client. PubsubMessage.Data will contain the resource name. PubsubMessage.MessageId is the ID of this message. It is guaranteed to be unique within the topic. PubsubMessage.PublishTime is the time at which the message was published. Notifications are only sent if the topic is non-empty. Topic names must be scoped to a project. service-PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com must have publisher permissions on the given Cloud Pub/Sub topic. Not having adequate permissions will cause the calls that send notifications to fail. If a notification cannot be published to Cloud Pub/Sub, errors will be logged to Stackdriver
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) Restricts notifications sent for messages matching a filter. If this is empty, all messages are matched. Syntax: https://cloud.google.com/appengine/docs/standard/python/search/query_strings Fields/functions available for filtering are: * messageType, from the MSH-9.1 field. For example, NOT messageType = "ADT". * send_date or sendDate, the YYYY-MM-DD date the message was sent in the dataset's timeZone, from the MSH-7 segment. For example, send_date < "2017-01-02". * sendTime, the timestamp when the message was sent, using the RFC3339 time format for comparisons, from the MSH-7 segment. For example, sendTime < "2017-01-02T00:00:00-05:00". * sendFacility, the care center that the message came from, from the MSH-4 segment. For example, sendFacility = "ABC". * PatientId(value, type), which matches if the message lists a patient having an ID of the given value and type in the PID-2, PID-3, or PID-4 segments. For example, PatientId("123456", "MRN"). * labels.x, a string value of the label with key x as set using the Message.labels map. For example, labels."priority"="high". The operator :* can be used to assert the existence of a label. For example, labels."priority":*. <a name="nested_notification_config"></a>The `notification_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_topic`
- Description: (Required) The Cloud Pub/Sub topic that notifications of changes are published on. Supplied by the client. PubsubMessage.Data will contain the resource name. PubsubMessage.MessageId is the ID of this message. It is guaranteed to be unique within the topic. PubsubMessage.PublishTime is the time at which the message was published. Notifications are only sent if the topic is non-empty. Topic names must be scoped to a project. service-PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com must have publisher permissions on the given Cloud Pub/Sub topic. Not having adequate permissions will cause the calls that send notifications to fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
