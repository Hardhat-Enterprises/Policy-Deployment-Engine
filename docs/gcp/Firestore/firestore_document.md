## 🛡️ Policy Deployment Engine: `firestore_document`

This section provides a concise policy evaluation for the `firestore_document` resource in GCP.

Reference: [Terraform Registry – firestore_document](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fields` | The document's [fields](https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents) formated as a json string. | true | None | None |
| `collection` | The collection ID, relative to database. For example: chatrooms or chatrooms/my-document/private-messages. | true | None | None |
| `document_id` | The client-assigned document ID to use for this document during creation. | true | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
