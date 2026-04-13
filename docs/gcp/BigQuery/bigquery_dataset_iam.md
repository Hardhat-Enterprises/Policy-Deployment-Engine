## 🛡️ Policy Deployment Engine: `bigquery_dataset_iam`

This section provides a concise policy evaluation for the `bigquery_dataset_iam` resource in GCP.

Reference: [Terraform Registry – bigquery_dataset_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | false | dataset_id defines the dataset to which IAM policies are applied | None | None |
| `member/members` | Each entry can have one of the following values: * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **iamMember:{principal}**: Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. This is used for example for workload/workforce federated identities (principal, principalSet). * **projectOwners**: A special identifier that represents the Owners of the project of the dataset. * **projectReaders**: A special identifier that represents the Viewers of the project of the dataset. * **projectWriters**: A special identifier that represents the Editors of the project of the dataset. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. | true | true | member/members define who gets access to the dataset | None | None |
| `role` | `google_bigquery_dataset_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | role defines the permissions granted to the member/members | OWNER | VIEWER |
| `policy_data` | a `google_iam_policy` data source. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
