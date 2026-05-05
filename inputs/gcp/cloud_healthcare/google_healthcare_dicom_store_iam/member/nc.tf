# Healthcare DICOM Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dicom_store_iam_member" "nc" {
  dataset        = "projects/my-project/locations/us-central1/datasets/example-dataset"
  dicom_store_id = "nc"
  role           = "roles/healthcare.dicomStoreViewer"

  # VIOLATION: allUsers grants public unauthenticated access to medical imaging data
  member = "allUsers"
}
