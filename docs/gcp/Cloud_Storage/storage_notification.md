## 🛡️ Policy Deployment Engine: `storage_notification`

This section provides a concise policy evaluation for the `storage_notification` resource in GCP.

Reference: [Terraform Registry – storage_notification](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_notification)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` |  | none | None | None |
| `payload_format` |  | none | None | None |
| `topic` | topic name, assumed to belong to the default GCP provider project, or the project-level name, i.e. `projects/my-gcp-project/topics/my-topic` or `my-topic`. If the project is not set in the provider, you will need to use the project-level name. - - - | none | None | None |
| `custom_attributes` |  | none | None | None |
| `event_types` |  | none | None | None |
| `object_name_prefix` |  | none | None | None |
