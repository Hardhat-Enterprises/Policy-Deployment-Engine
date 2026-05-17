## 🛡️ Policy Deployment Engine: `google_monitoring_notification_channel`

This section provides a concise policy evaluation for the `google_monitoring_notification_channel` resource in GCP.

Reference: [Terraform Registry – google_monitoring_notification_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The type of the notification channel (e.g. "email", "slack"). | true | false | Channel type is a functional setting with no direct security impact. | None | None |
| `labels` | Configuration fields for the channel. Sensitive credentials such as auth_token, password, and service_key must NOT be placed here as they are stored in plaintext. | false | true | Placing secrets in labels exposes them in plain text in Terraform state and GCP API responses. Credentials must be placed in the sensitive_labels block instead. | `labels = { channel_name = "#alerts" }` | `labels = { auth_token = "my-token" }` |
| `user_labels` | User-supplied key/value data for organising the channel. | false | false | Organisational metadata with no security impact. | None | None |
| `description` | Human-readable description of the channel. | false | false | Descriptive field with no security impact. | None | None |
| `display_name` | Human-readable name for the channel. | false | false | Display metadata with no security impact. | None | None |
| `enabled` | Whether notifications are forwarded to this channel. | false | false | Disabling a channel is a legitimate operational choice and does not create a security risk on its own. | None | None |
| `project` | The project in which the channel resides. | false | false | Project is an organisational field, not a security control. | None | None |
| `force_delete` | If true, the channel will be deleted even if referenced by alert policies. | false | true | Forcing deletion of a channel that is still referenced by alert policies silently removes active alerting, creating a gap in incident detection and response. | `force_delete = false` | `force_delete = true` |

### sensitive_labels Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `auth_token` | Authorization token for Slack channels. | false | false | When placed in sensitive_labels, the value is masked by GCP and not exposed in API responses. This is the correct location for this credential. | None | None |
| `password` | Password for webhook_basicauth channels. | false | false | When placed in sensitive_labels, the value is masked by GCP. This is the correct location for this credential. | None | None |
| `service_key` | Service key for PagerDuty channels. | false | false | When placed in sensitive_labels, the value is masked by GCP. This is the correct location for this credential. | None | None |

---

## Policies Written

| Policy | Type | Attribute | Situation |
|--------|------|-----------|-----------|
| `auth_token` | whitelist | `labels.auth_token` | Prevents auth_token from being stored in plain-text labels — must be placed in the sensitive_labels block (Slack channels) |
| `password` | whitelist | `labels.password` | Prevents password from being stored in plain-text labels — must be placed in the sensitive_labels block (webhook_basicauth channels) |
| `service_key` | whitelist | `labels.service_key` | Prevents service_key from being stored in plain-text labels — must be placed in the sensitive_labels block (PagerDuty channels) |
| `force_delete` | whitelist | `force_delete` | Prevents unsafe deletion of channels still referenced by active alert policies |

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `notification_channels_required` on alert policies | Not applicable to this resource type; also not a security control — the presence of a notification channel does not inherently make an alert policy more secure |
| `enabled` | Disabling a channel is a valid operational decision, not a security violation |
