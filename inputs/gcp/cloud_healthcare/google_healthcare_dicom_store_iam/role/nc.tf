# Healthcare DICOM Store IAM - role (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dicom_store_iam_member" "nc" {
  dicom_store_id = "your-dicom-store-id"
  member         = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions — violates least privilege
  role = "roles/owner"
}
