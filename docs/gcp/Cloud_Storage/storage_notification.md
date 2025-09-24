## 🛡️ Policy Deployment Engine: `storage_notification`

This section provides a concise policy evaluation for the `storage_notification` resource in GCP.

Reference: [Terraform Registry – storage_notification](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_notification)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` |  | false | false | None | None | None |
| `payload_format` |  | false | false | None | None | None |
| `topic` | topic name, assumed to belong to the default GCP provider project, or the project-level name, i.e. `projects/my-gcp-project/topics/my-topic` or `my-topic`. If the project is not set in the provider, you will need to use the project-level name. - - - | false | false | None | None | None |
| `custom_attributes` |  | false | false | None | None | None |
| `event_types` |  | false | false | None | None | None |
| `object_name_prefix` |  | false | false | None | None | None |
