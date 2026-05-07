## 🛡️ Policy Deployment Engine: `gke_backup_restore_plan_iam`

This section provides a concise policy evaluation for the `gke_backup_restore_plan_iam` resource in GCP.

Reference: [Terraform Registry – gke_backup_restore_plan_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_restore_plan_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Used to find the parent resource to bind the IAM policy to. If not specified, the value will be parsed from the identifier of the parent resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. | false | false | None | None | None |
| `name` |  | false | false | None | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | false | None | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | false | true | Only corporate identities and internal service accounts are allowed. Cross-project groups and personal emails are blocked. | group:team@company.com | group:external@other.com |
| `role` | `google_gke_backup_restore_plan_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | false | true | Least privilege principle: use specific restore roles. | roles/gkebackup.restoreAdmin | roles/owner |
| `policy_data` | a `google_iam_policy` data source. | false | false | None | None | None |
