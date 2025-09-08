## 🛡️ Policy Deployment Engine: `google_folder`

This section provides a concise policy evaluation for the `google_folder` resource in GCP.

Reference: [Terraform Registry – google_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters. | none | None | None |
| `parent` | Must be of the form `folders/{folder_id}` or `organizations/{org_id}`. | none | None | None |
| `deletion_protection` |  | none | None | None |
| `tags` |  | none | None | None |
