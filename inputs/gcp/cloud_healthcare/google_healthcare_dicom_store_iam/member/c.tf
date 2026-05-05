# Healthcare DICOM Store IAM - member (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_dicom_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"
}

resource "google_healthcare_dicom_store_iam_member" "c" {
  dataset        = google_healthcare_dataset.c.id
  dicom_store_id = google_healthcare_dicom_store.c.name
  role           = "roles/healthcare.dicomStoreViewer"

  # COMPLIANT: specific service account — not a public or overly broad identity
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
