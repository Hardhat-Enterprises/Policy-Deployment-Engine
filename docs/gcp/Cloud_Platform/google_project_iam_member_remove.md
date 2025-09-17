## 🛡️ Policy Deployment Engine: `google_project_iam_member_remove`

This section provides a concise policy evaluation for the `google_project_iam_member_remove` resource in GCP.

Reference: [Terraform Registry – google_project_iam_member_remove](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member_remove)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` |  | false | false | None | None | None |
| `role` |  | false | false | None | None | None |
| `member` | Each entry can have one of the following values: * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | false | false | None | None | None |
