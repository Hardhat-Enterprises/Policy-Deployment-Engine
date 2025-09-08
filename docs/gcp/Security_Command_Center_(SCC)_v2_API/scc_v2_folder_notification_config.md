## 🛡️ Policy Deployment Engine: `scc_v2_folder_notification_config`

This section provides a concise policy evaluation for the `scc_v2_folder_notification_config` resource in GCP.

Reference: [Terraform Registry – scc_v2_folder_notification_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_v2_folder_notification_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pubsub_topic` | The Pub/Sub topic to send notifications to. Its format is "projects/[project_id]/topics/[topic]". | true | None | None |
| `folder` | Numerical ID of the parent folder. | true | None | None |
| `config_id` | This must be unique within the organization. | true | None | None |
| `description` | The description of the notification config (max of 1024 characters). | false | None | None |
| `location` | Location ID of the parent organization. If not provided, 'global' will be used as the default location. | false | None | None |

### streaming_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `filter` | Expression that defines the filter to apply across create/update events of assets or findings as specified by the event type. The expression is a list of zero or more restrictions combined via logical operators AND and OR. Parentheses are supported, and OR has higher precedence than AND. Restrictions have the form <field> <operator> <value> and may have a - character in front of them to indicate negation. The fields map to those defined in the corresponding resource. The supported operators are: * = for all value types. * >, <, >=, <= for integer values. * :, meaning substring matching, for strings. The supported value types are: * string literals in quotes. * integer literals without quotes. * boolean literals true and false without quotes. See [Filtering notifications](https://cloud.google.com/security-command-center/docs/how-to-api-filter-notifications) for information on how to write a filter. | true | None | None |
