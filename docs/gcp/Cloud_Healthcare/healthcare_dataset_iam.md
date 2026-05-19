## 🛡️ Policy Deployment Engine: `healthcare_dataset_iam`

This section provides a concise policy evaluation for the `healthcare_dataset_iam` resource in GCP.

Reference: [Terraform Registry – healthcare_dataset_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dataset_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | `{project_id}/{location_name}/{dataset_name}` or `{location_name}/{dataset_name}`. In the second form, the provider's project setting will be used as a fallback. | true | false | The dataset_id is a required reference to identify the parent dataset and does not directly affect security posture. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | true | true | Using allUsers or allAuthenticatedUsers grants unauthenticated or broadly authenticated access to all stores within the dataset (FHIR, DICOM, HL7v2, Consent), exposing PHI to public access. This violates HIPAA minimum necessary access requirements. Only specific, named identities should be granted access. | member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com" | member = "allUsers" or member = "allAuthenticatedUsers" |
| `role` | `google_healthcare_dataset_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Primitive roles (owner, editor, viewer) grant overly broad permissions across the entire project, violating the principle of least privilege. Since the dataset is the top-level container for all healthcare stores, a primitive role at this level grants unrestricted access to all FHIR, DICOM, HL7v2, and Consent data within it. | role = "roles/healthcare.datasetViewer" or role = "roles/healthcare.datasetAdmin" | role = "roles/owner" or role = "roles/editor" or role = "roles/viewer" |
| `policy_data` | a `google_iam_policy` data source. | false | false | The policy_data field is only required when using google_healthcare_dataset_iam_policy. Security is enforced through the member and role fields within the policy definition. | None | None |
