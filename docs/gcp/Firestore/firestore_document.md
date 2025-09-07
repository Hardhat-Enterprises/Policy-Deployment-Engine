## 🛡️ Policy Deployment Engine: `firestore_document`

This section provides a concise policy evaluation for the `firestore_document` resource in GCP.

Reference: [Terraform Registry – firestore_document](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document)

---

## 1. Argument Reference

### `fields`
- Description: (Required) The document's [fields](https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents) formated as a json string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collection`
- Description: (Required) The collection ID, relative to database. For example: chatrooms or chatrooms/my-document/private-messages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `document_id`
- Description: (Required) The client-assigned document ID to use for this document during creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Optional) The Firestore database id. Defaults to `"(default)"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
