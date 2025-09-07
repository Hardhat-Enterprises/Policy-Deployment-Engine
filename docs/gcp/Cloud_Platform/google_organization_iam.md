## 🛡️ Policy Deployment Engine: `google_organization_iam`

This section provides a concise policy evaluation for the `google_organization_iam` resource in GCP.

Reference: [Terraform Registry – google_organization_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_organization_iam)

---

## 1. Argument Reference

### `member/members`
- Description: Each entry can have one of the following values: * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: `google_organization_iam_binding` can be used per role. Note that custom roles must be of the format `organizations/{{org_id}}/roles/{{role_id}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: the IAM policy that will be applied to the organization. The policy will be merged with any existing policy applied to the organization. Changing this updates the policy. Deleting this removes all policies from the organization, locking out users without organization-level access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audit_log_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: Structure is [documented below](#nested_condition). --- <a name="nested_audit_log_config"></a>The `audit_log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exempted_members`
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
- Description: ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
