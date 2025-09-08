## 🛡️ Policy Deployment Engine: `google_project_iam`

This section provides a concise policy evaluation for the `google_project_iam` resource in GCP.

Reference: [Terraform Registry – google_project_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `member/members` | Each entry can have one of the following values: * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | none | None | None |
| `role` | `google_project_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | none | None | None |
| `policy_data` | the IAM policy that will be applied to the project. The policy will be merged with any existing policy applied to the project. Changing this updates the policy. Deleting this removes all policies from the project, locking out users without organization-level access. | none | None | None |
| `project` | inferred from the provider. | none | None | None |
| `service` |  | none | None | None |

### audit_log_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `log_type` |  | none | None | None |
| `exempted_members` |  | none | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` |  | none | None | None |
| `title` |  | none | None | None |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | none | None | None |
