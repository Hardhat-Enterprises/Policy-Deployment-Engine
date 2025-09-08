## 🛡️ Policy Deployment Engine: `google_service_account`

This section provides a concise policy evaluation for the `google_service_account` resource in GCP.

Reference: [Terraform Registry – google_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `account_id` | account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])` to comply with RFC1035. Changing this forces a new service account to be created. | none | None | None |
| `display_name` | Can be updated without creating a new resource. | none | None | None |
| `description` | Must be less than or equal to 256 UTF-8 bytes. | none | None | None |
| `disabled` | Must be set after creation to disable a service account. | none | None | None |
| `project` | Defaults to the provider project configuration. | none | None | None |
| `create_ignore_already_exists` |  | none | None | None |
