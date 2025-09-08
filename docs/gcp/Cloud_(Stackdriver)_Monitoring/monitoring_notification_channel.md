## 🛡️ Policy Deployment Engine: `monitoring_notification_channel`

This section provides a concise policy evaluation for the `monitoring_notification_channel` resource in GCP.

Reference: [Terraform Registry – monitoring_notification_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of the notification channel. This field matches the value of the NotificationChannelDescriptor.type field. See https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.notificationChannelDescriptors/list to get the list of valid values such as "email", "slack", etc... | true | None | None |
| `labels` | Configuration fields that define the channel and its behavior. The permissible and required labels are specified in the NotificationChannelDescriptor corresponding to the type field. Labels with sensitive data are obfuscated by the API and therefore Terraform cannot determine if there are upstream changes to these fields. They can also be configured via the sensitive_labels block, but cannot be configured in both places. | false | None | None |
| `user_labels` | User-supplied key/value data that does not need to conform to the corresponding NotificationChannelDescriptor's schema, unlike the labels field. This field is intended to be used for organizing and identifying the NotificationChannel objects.The field can contain up to 64 entries. Each key and value is limited to 63 Unicode characters or 128 bytes, whichever is smaller. Labels and values can contain only lowercase letters, numerals, underscores, and dashes. Keys must begin with a letter. | false | None | None |
| `description` | An optional human-readable description of this notification channel. This description may provide additional details, beyond the display name, for the channel. This may not exceed 1024 Unicode characters. | false | None | None |
| `display_name` | An optional human-readable name for this notification channel. It is recommended that you specify a non-empty and unique name in order to make it easier to identify the channels in your project, though this is not enforced. The display name is limited to 512 Unicode characters. | false | None | None |
| `enabled` | Whether notifications are forwarded to the described channel. This makes it possible to disable delivery of notifications to a particular channel without removing the channel from all alerting policies that reference the channel. This is a more convenient approach when the change is temporary and you want to receive notifications from the same set of alerting policies on the channel at some point in the future. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `force_delete` | of its use in alert policies (the policies will be updated to remove the channel). If false, channels that are still referenced by an existing alerting policy will fail to be deleted in a delete operation. | none | None | None |

### sensitive_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auth_token` | An authorization token for a notification channel. Channel types that support this field include: slack **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `password` | An password for a notification channel. Channel types that support this field include: webhook_basicauth **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `service_key` | An servicekey token for a notification channel. Channel types that support this field include: pagerduty **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
