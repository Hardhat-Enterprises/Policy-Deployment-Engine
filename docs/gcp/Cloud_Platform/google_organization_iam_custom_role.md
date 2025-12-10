## 🛡️ Policy Deployment Engine: `google_organization_iam_custom_role`

This section provides a concise policy evaluation for the `google_organization_iam_custom_role` resource in GCP.

Reference: [Terraform Registry – google_organization_iam_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_organization_iam_custom_role)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `role_id` | The role id to use for this role. | true | false | Identifier only and does not grant permissions by itself | None | None |
| `org_id` | The numeric ID of the organization in which you want to create a custom role. | true | false | Identifier only and does not affect access by itself | None | None |
| `title` |  A human-readable title for the role. | true | false | Label only and has no direct security effect | None | None |
| `description` | A human-readable description for the role. | false | false | Documentation only and has no direct security effect | None | None |
| `permissions` |  The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified. | true | true | Defines proper capabilities. Privilege escalation may result from risky or administrator-level permissions. | permissions = ["iam.roles.list", "resourcemanager.projects.get"] | permissions = ["iam.roles.delete", "resourcemanager.*"] |
| `stage` | Defaults to `GA`. List of possible stages is [here](https://cloud.google.com/iam/reference/rest/v1/organizations.roles#Role.RoleLaunchStage). | false | true | Unstable stages like ALPHA or BETA may cause unexpected behavior. Stable GA or DISABLED are safer | stage = "GA"  or  stage = "DISABLED" | stage = "ALPHA" |
