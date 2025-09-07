## 🛡️ Policy Deployment Engine: `essential_contacts_contact`

This section provides a concise policy evaluation for the `essential_contacts_contact` resource in GCP.

Reference: [Terraform Registry – essential_contacts_contact](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/essential_contacts_contact)

---

## 1. Argument Reference

### `email`
- Description: (Required) The email address to send notifications to. This does not need to be a Google account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_category_subscriptions`
- Description: (Required) The categories of notifications that the contact will receive communications for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language_tag`
- Description: (Required) The preferred language for notifications, as a ISO 639-1 language code. See Supported languages for a list of supported languages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The resource to save this contact for. Format: organizations/{organization_id}, folders/{folder_id} or projects/{project_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
