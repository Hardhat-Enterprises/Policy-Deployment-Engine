# Healthcare DICOM Store IAM - role (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dicom_store_iam_member" "nc" {
  dataset        = "projects/my-project/locations/us-central1/datasets/example-dataset"
  dicom_store_id = "nc"
  member         = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions — violates least privilege
  role = "roles/owner"
}
