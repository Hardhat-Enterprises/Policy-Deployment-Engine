## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool_iam`

This section provides a concise policy evaluation for the `iam_workload_identity_pool_iam` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_iam)

---

## 1. Argument Reference

### `workload_identity_pool_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `member/members`
- Description: Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: `google_iam_workload_identity_pool_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: a `google_iam_policy` data source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: Structure is documented below. ---
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `condition` Block

### `expression`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
