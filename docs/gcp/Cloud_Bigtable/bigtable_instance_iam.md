## 🛡️ Policy Deployment Engine: `bigtable_instance_iam`

This section provides a concise policy evaluation for the `bigtable_instance_iam` resource in GCP.

Reference: [Terraform Registry – bigtable_instance_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance_iam)

---

## 1. Argument Reference

### `project`
- Description: is not provided, Terraform will use the provider default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: For `google_bigtable_instance_iam_member` or `google_bigtable_instance_iam_binding`:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `member/members`
- Description: Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: `google_bigtable_instance_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. Read more about roles [here](https://cloud.google.com/bigtable/docs/access-control#roles).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: <a name="nested_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

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
- Description: For `google_bigtable_instance_iam_policy` only:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
