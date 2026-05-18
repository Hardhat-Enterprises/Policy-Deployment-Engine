## 🛡️ Policy Deployment Engine: `healthcare_dicom_store_iam`

This section provides a concise policy evaluation for the `healthcare_dicom_store_iam` resource in GCP.

Reference: [Terraform Registry – healthcare_dicom_store_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dicom_store_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dicom_store_id` | `{project_id}/{location_name}/{dataset_name}/{dicom_store_name}` or `{location_name}/{dataset_name}/{dicom_store_name}`. In the second form, the provider's project setting will be used as a fallback. | true | false | The dicom_store_id is a required reference to identify the DICOM store and does not directly affect security posture. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | true | true | Using allUsers or allAuthenticatedUsers grants unauthenticated or broadly authenticated access to medical imaging data (X-rays, MRIs, CT scans) stored in the DICOM store. This violates HIPAA minimum necessary access requirements and exposes sensitive patient imaging data to public access. | member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com" | member = "allUsers" or member = "allAuthenticatedUsers" |
| `role` | `google_healthcare_dicom_store_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Primitive roles (owner, editor, viewer) grant overly broad permissions across the entire project, violating the principle of least privilege. Healthcare-specific DICOM roles should be used to limit access strictly to medical imaging store operations. | role = "roles/healthcare.dicomStoreViewer" or role = "roles/healthcare.dicomEditor" or role = "roles/healthcare.dicomStoreAdmin" | role = "roles/owner" or role = "roles/editor" or role = "roles/viewer" |
| `policy_data` | a `google_iam_policy` data source. | false | false | The policy_data field is only required when using google_healthcare_dicom_store_iam_policy. Security is enforced through the member and role fields within the policy definition. | None | None |
