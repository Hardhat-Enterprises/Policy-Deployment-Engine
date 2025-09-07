## 🛡️ Policy Deployment Engine: `billing_account_iam`

This section provides a concise policy evaluation for the `billing_account_iam` resource in GCP.

Reference: [Terraform Registry – billing_account_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam)

---

## 1. Argument Reference

### `billing_account_id`
- Description: For `google_billing_account_iam_member` or `google_billing_account_iam_binding`:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `member/members`
- Description: Each entry can have one of the following values: * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: `google_billing_account_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. Read more about roles [here](https://cloud.google.com/bigtable/docs/access-control#roles). `google_billing_account_iam_policy` only:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
