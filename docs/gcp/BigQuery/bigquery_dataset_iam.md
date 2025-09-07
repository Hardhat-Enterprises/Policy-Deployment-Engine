## 🛡️ Policy Deployment Engine: `bigquery_dataset_iam`

This section provides a concise policy evaluation for the `bigquery_dataset_iam` resource in GCP.

Reference: [Terraform Registry – bigquery_dataset_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam)

---

## 1. Argument Reference

### `dataset_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `member/members`
- Description: Each entry can have one of the following values: * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **iamMember:{principal}**: Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. This is used for example for workload/workforce federated identities (principal, principalSet). * **projectOwners**: A special identifier that represents the Owners of the project of the dataset. * **projectReaders**: A special identifier that represents the Viewers of the project of the dataset. * **projectWriters**: A special identifier that represents the Editors of the project of the dataset. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: `google_bigquery_dataset_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: a `google_iam_policy` data source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
