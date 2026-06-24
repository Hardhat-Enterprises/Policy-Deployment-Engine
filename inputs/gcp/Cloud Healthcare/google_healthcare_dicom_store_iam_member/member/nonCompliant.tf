# Healthcare DICOM Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dicom_store_iam_member" "non_compliant_example_1" {
  provider       = google-beta
  dicom_store_id = "non_compliant_example_1"
  role           = "roles/healthcare.dicomStoreViewer"

  # VIOLATION: allUsers grants public unauthenticated access to medical imaging data
  member = "allUsers"
}
