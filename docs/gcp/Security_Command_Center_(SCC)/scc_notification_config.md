## 🛡️ Policy Deployment Engine: `scc_notification_config`

This section provides a concise policy evaluation for the `scc_notification_config` resource in GCP.

Reference: [Terraform Registry – scc_notification_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_notification_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pubsub_topic` | The Pub/Sub topic to send notifications to. Its format is "projects/[project_id]/topics/[topic]". | true | false | Notifications must be delivered to approved, secured Pub/Sub topics to maintain the integrity and confidentiality of security alerts. | Pub/Sub topic is correctly configured and points to an approved, secured topic within the organization. | Pub/Sub topic is missing, invalid, or points to an unapproved/unsecured destination. |
| `streaming_config` | The config for triggering streaming-based notifications. Structure is [documented below](#nested_streaming_config). | true | false | Streaming configuration must include properly scoped filters to ensure only relevant findings generate alerts. | Streaming config includes a valid filter that correctly targets relevant findings or assets. | Streaming config is missing, invalid, or has overly broad/narrow filters leading to loss of visibility or noise. |
| `organization` | The organization whose Cloud Security Command Center the Notification Config lives in. | true | false | None | None | None |
| `config_id` | This must be unique within the organization. | true | false | Each notification config must have a unique identifier to ensure proper management and avoid conflicts within the organization. | Config_id is unique within the organization and follows naming conventions. | Config_id is missing, not unique, or conflicts with existing notification configurations. |
| `description` | The description of the notification config (max of 1024 characters). | false | false | None | None | None |
