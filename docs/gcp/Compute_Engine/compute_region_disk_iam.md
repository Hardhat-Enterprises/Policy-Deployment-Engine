## 🛡️ Policy Deployment Engine: `compute_region_disk_iam`

This section provides a concise policy evaluation for the `compute_region_disk_iam` resource in GCP.

Reference: [Terraform Registry – compute_region_disk_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_disk_iam)

---

## 1. Argument Reference

### `region`
- Description: the value will be parsed from the identifier of the parent resource. If no region is provided in the parent identifier and no region is specified, it is taken from the provider configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
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
- Description: `google_compute_region_disk_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: a `google_iam_policy` data source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
