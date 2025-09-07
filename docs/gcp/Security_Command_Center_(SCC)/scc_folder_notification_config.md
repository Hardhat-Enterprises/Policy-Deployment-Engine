## 🛡️ Policy Deployment Engine: `scc_folder_notification_config`

This section provides a concise policy evaluation for the `scc_folder_notification_config` resource in GCP.

Reference: [Terraform Registry – scc_folder_notification_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_folder_notification_config)

---

## 1. Argument Reference

### `pubsub_topic`
- Description: (Required) The Pub/Sub topic to send notifications to. Its format is "projects/[project_id]/topics/[topic]".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `streaming_config`
- Description: (Required) The config for triggering streaming-based notifications. Structure is [documented below](#nested_streaming_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder`
- Description: (Required) Numerical ID of the parent folder.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_id`
- Description: (Required) This must be unique within the organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the notification config (max of 1024 characters). <a name="nested_streaming_config"></a>The `streaming_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) Expression that defines the filter to apply across create/update events of assets or findings as specified by the event type. The expression is a list of zero or more restrictions combined via logical operators AND and OR. Parentheses are supported, and OR has higher precedence than AND. Restrictions have the form <field> <operator> <value> and may have a - character in front of them to indicate negation. The fields map to those defined in the corresponding resource. The supported operators are: * = for all value types. * >, <, >=, <= for integer values. * :, meaning substring matching, for strings. The supported value types are: * string literals in quotes. * integer literals without quotes. * boolean literals true and false without quotes. See [Filtering notifications](https://cloud.google.com/security-command-center/docs/how-to-api-filter-notifications) for information on how to write a filter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
