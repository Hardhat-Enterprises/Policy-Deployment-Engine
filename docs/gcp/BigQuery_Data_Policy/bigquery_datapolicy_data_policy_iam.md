## 🛡️ Policy Deployment Engine: `bigquery_datapolicy_data_policy_iam`

This section provides a concise policy evaluation for the `bigquery_datapolicy_data_policy_iam` resource in GCP.

Reference: [Terraform Registry – bigquery_datapolicy_data_policy_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_datapolicy_data_policy_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Used to find the parent resource to bind the IAM policy to. If not specified, the value will be parsed from the identifier of the parent resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. | true | false | Ensure the location must be configured to correct location | Set location to Australia. | Other locations are not valid. |
| `data_policy_id` | User-assigned (human readable) ID of the data policy that needs to be unique within a project. Used as {dataPolicyId} in part of the resource name. | false | false | Display policy id has no impact on the security of the resource. | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | false | Project has no impact on the security of the resource. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | true | false | Ensure the member must be configured so that unauthorized access can be prevented. | Set member with valid emails. | Other access will be denided. |
| `role` | `google_bigquery_datapolicy_data_policy_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | false | false | Role has no impact on the security of the resource. | None | None |
| `policy_data` | a `google_iam_policy` data source. | false | false | Policy data has no impact on the security of the resource. | None | None |
