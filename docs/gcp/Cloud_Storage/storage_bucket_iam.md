## 🛡️ Policy Deployment Engine: `storage_bucket_iam`

This section provides a concise policy evaluation for the `storage_bucket_iam` resource in GCP.

Reference: [Terraform Registry – storage_bucket_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The storage bucket in GCP | true | false | References to the existing bucket | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | true | true | Public access should be prevented | domain:example.com | allUsers |
| `role` | `google_storage_bucket_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | false | Uses existing roles present in the organization | None | None |
| `policy_data` | a `google_iam_policy` data source. | true | false | References to a data source | None | None |
