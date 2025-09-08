## 🛡️ Policy Deployment Engine: `logging_linked_dataset`

This section provides a concise policy evaluation for the `logging_linked_dataset` resource in GCP.

Reference: [Terraform Registry – logging_linked_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_linked_dataset)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `link_id` | The id of the linked dataset. | true | None | None |
| `bucket` | The bucket to which the linked dataset is attached. | true | None | None |
| `description` | Describes this link. The maximum length of the description is 8000 characters. | false | None | None |
| `parent` | The parent of the linked dataset. | false | None | None |
| `location` | The location of the linked dataset. | false | None | None |
