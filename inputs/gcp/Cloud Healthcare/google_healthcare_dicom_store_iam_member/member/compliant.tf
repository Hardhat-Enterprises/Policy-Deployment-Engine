# Healthcare DICOM Store IAM - member (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dicom_store_iam_member" "compliant_example_1" {
  dicom_store_id = "compliant_example_1"
  role           = "roles/healthcare.dicomStoreViewer"

  # COMPLIANT: specific service account — not a public or overly broad identity
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
