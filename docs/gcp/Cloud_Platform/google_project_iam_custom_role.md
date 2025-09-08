## 🛡️ Policy Deployment Engine: `google_project_iam_custom_role`

This section provides a concise policy evaluation for the `google_project_iam_custom_role` resource in GCP.

Reference: [Terraform Registry – google_project_iam_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `role_id` |  | none | None | None |
| `title` | * `permissions` (Required) The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified. | none | None | None |
| `project` | Defaults to the provider project configuration. | none | None | None |
| `stage` | Defaults to `GA`. List of possible stages is [here](https://cloud.google.com/iam/reference/rest/v1/organizations.roles#Role.RoleLaunchStage). | none | None | None |
| `description` |  | none | None | None |
