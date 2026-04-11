## 🛡️ Policy Deployment Engine: `pubsub_subscription`

This section provides a concise policy evaluation for the `google_pubsub_subscription` resource in GCP.

Reference: [Terraform Registry – google_pubsub_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the subscription. | true | false | None | None | None |
| `topic` | A reference to a Topic resource. | true | false | None | None | None |
| `enable_exactly_once_delivery` | If true, Pub/Sub guarantees each message is delivered exactly once and never re-delivered after acknowledgement. | false | true | Without exactly-once delivery, subscribers may process duplicate messages, leading to data integrity issues, double-charging, or inconsistent state. Enabling this setting eliminates replay attacks on the message layer and ensures reliable downstream processing. | true | false |
| `ack_deadline_seconds` | Maximum time for a subscriber to acknowledge a message before redelivery. Min 10s, max 600s. | false | false | None | None | None |
| `message_retention_duration` | How long to retain unacknowledged messages, from 10 minutes to 31 days. Defaults to 7 days. | false | false | None | None | None |
| `retain_acked_messages` | If true, acknowledged messages are retained until they fall out of the retention window. | false | false | None | None | None |
| `push_config` | Configuration for push delivery. If empty, the subscriber will pull messages. | false | false | None | None | None |
| `dead_letter_policy` | Policy for dead lettering messages after repeated delivery failures. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
