## 🛡️ Policy Deployment Engine: `healthcare_dicom_store_iam`

This section provides a concise policy evaluation for the `healthcare_dicom_store_iam` resource in GCP.

Reference: [Terraform Registry – healthcare_dicom_store_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dicom_store_iam)

---

## 1. Argument Reference

### `dicom_store_id`
- Description: `{project_id}/{location_name}/{dataset_name}/{dicom_store_name}` or `{location_name}/{dataset_name}/{dicom_store_name}`. In the second form, the provider's project setting will be used as a fallback.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `member/members`
- Description: Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: `google_healthcare_dicom_store_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_data`
- Description: a `google_iam_policy` data source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
