## 🛡️ Policy Deployment Engine: `cloudfunctions_function_iam`

This section provides a concise policy evaluation for the `cloudfunctions_function_iam` resource in GCP.

Reference: [Terraform Registry – cloudfunctions_function_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function_iam)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `region` | the value will be parsed from the identifier of the parent resource. If no region is provided in the parent identifier and no region is specified, it is taken from the provider configuration. | none | None | None |
| `cloud_function` |  | none | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | none | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | none | None | None |
| `role` | `google_cloudfunctions_function_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | none | None | None |
| `policy_data` | a `google_iam_policy` data source. | none | None | None |
