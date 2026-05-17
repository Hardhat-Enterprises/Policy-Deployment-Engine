## 🛡️ Policy Deployment Engine: `cloud_run_v2_worker_pool_iam`

This section provides a concise policy evaluation for the `cloud_run_v2_worker_pool_iam` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_worker_pool_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_worker_pool_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | the value will be parsed from the identifier of the parent resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. | false | true | Restricting the location ensures compliance with data residency, regulatorypolicies. Limiting resources to approved regions reduces legal, privacy risks associated with storing or processing data. | australia-southeast1 | us-east1 |
| `name` | Used to find the parent resource to bind the IAM policy to | true | false | This field does not introduce direct security risk as it only defines an identifier | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | false | This field only specifies project context and has no direct relation to security. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | true | true | Controlling which identities can be assigned access prevents unauthorized access to Cloud Run resources. Restricting access to trusted users, groups, or service accounts minimizes the risk of data exposure, misuse, and external compromise. | user:jane@example.com | allUsers |
| `role` | `google_cloud_run_v2_job_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Enforcing restrictions on IAM roles ensures adherence to the principle of least privilege. | role/viewer | role/admin |
| `policy_data` | a `google_iam_policy` data source. | false | false | Only references an external policy definition, does not need a policy as there is no effect on security.  | None | None |
