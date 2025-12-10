## 🛡️ Policy Deployment Engine: `google_project_iam_custom_role`

This section provides a concise policy evaluation for the `google_project_iam_custom_role` resource in GCP.

Reference: [Terraform Registry – google_project_iam_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `role_id` |  | false | false | None | None | None |
| `title` | * `permissions` (Required) The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified. | false | false | None | None | None |
| `project` | Defaults to the provider project configuration. | false | false | None | None | None |
| `stage` | Defaults to `GA`. List of possible stages is [here](https://cloud.google.com/iam/reference/rest/v1/organizations.roles#Role.RoleLaunchStage). | false | false | None | None | None |
| `description` |  | false | false | None | None | None |
