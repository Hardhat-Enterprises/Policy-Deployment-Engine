## 🛡️ Policy Deployment Engine: `essential_contacts_contact`

This section provides a concise policy evaluation for the `essential_contacts_contact` resource in GCP.

Reference: [Terraform Registry – essential_contacts_contact](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/essential_contacts_contact)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | The email address to send notifications to. This does not need to be a Google account. | true | None | None |
| `notification_category_subscriptions` | The categories of notifications that the contact will receive communications for. | true | None | None |
| `language_tag` | The preferred language for notifications, as a ISO 639-1 language code. See Supported languages for a list of supported languages. | true | None | None |
| `parent` | The resource to save this contact for. Format: organizations/{organization_id}, folders/{folder_id} or projects/{project_id} | true | None | None |
