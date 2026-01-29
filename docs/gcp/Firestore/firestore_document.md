## 🛡️ Policy Deployment Engine: `firestore_document`

This section provides a concise policy evaluation for the `firestore_document` resource in GCP.

Reference: [Terraform Registry – firestore_document](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fields` | The document's [fields](https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents) formated as a json string.Firestore documents must include both 'field1' and 'field2' to satisfy mandatory data schema. | true | false | None | None | None |
| `collection` | The collection ID, relative to database. For example: chatrooms or chatrooms/my-document/private-messages.Firestore documents must be placed in the 'my_collection' collection to maintain standardized data organization. | true | false | None | None | None |
| `document_id` | The client-assigned document ID to use for this document during creation. | true | false | None | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used.Firestore documents must reside in project 'abcd_1234' to comply with organizational project governance. | true | false | None | None | None |
