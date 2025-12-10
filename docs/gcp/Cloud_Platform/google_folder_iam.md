## 🛡️ Policy Deployment Engine: `google_folder_iam`

This section provides a concise policy evaluation for the `google_folder_iam` resource in GCP.

Reference: [Terraform Registry – google_folder_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `member/members` | Each entry can have one of the following values: * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | true | true | Improperly assigned members can cause unauthorised access or privilege escalation. | members = ["user:alice@example.com"] | members = ["domain:example.com"]  # grants access to entire domain |
| `role` | `google_folder_iam_binding` can be used per role. Note that custom roles must be of the format `organizations/{{org_id}}/roles/{{role_id}}`. | true | true | broad roles like Owner/Editor grant excessive privileges. | role = "roles/viewer" | role = "roles/owner" |
| `policy_data` | the IAM policy that will be applied to the folder. The policy will be merged with any existing policy applied to the folder. Changing this updates the policy. Deleting this removes all policies from the folder, locking out users without folder-level access. | false | true | IAM policy may override existing access and accidentally grant broad roles (e.g., Owner/Editor). | None | None |
| `folder` | The resource name of the folder the policy is attached to. Its format is folders/{folder_id}. | true | false | identifier only, not directly affect security | None | None |
| `service` | Service enabled for audit logging (used with audit_config). | false | true | Audit logging ensures accountability, whereas misconfiguration can conceal intentional or accidental activities. | service = "allServices" | service = "" |
| `audit_log_config` |  The configuration for logging of each type of permission. This can be specified multiple times. Structure is documented below. | false | true | Audit logs are critical for detecting misuse and maintaining compliance. | None | None |
| `condition` | Structure is [documented below](#nested_condition). --- | false | true | To reduce risk by applying time- or context-based constraints to access. Misconfiguration can unintentionally allow or block access. | None | None |

### audit_log_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `log_type` | Permission type for which logging is to be configured. Must be one of DATA_READ, DATA_WRITE, or ADMIN_READ. | true | true | Ensures important access events are captured in logs. | log_type = "ADMIN_READ" | log_type = "" |
| `exempted_members` | Identities that do not cause logging for this type of permission. The format is the same as that for members. | false | true | Members being excluded from records weakens control and creates blind spots. | exempted_members not set | exempted_members = ["user:admin@example.com"] |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | true | Defines when the role is valid. Incorrect expressions may lead to overly permissive or broken access control. | expression = "request.time < timestamp('2025-12-31T00:00:00Z')" | expression = "" |
| `title` | A title for the expression, i.e. a short string describing its purpose. | true | false | label only, no security impact | None | None |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | false | false | It's just documentation, no security impact | None | None |
