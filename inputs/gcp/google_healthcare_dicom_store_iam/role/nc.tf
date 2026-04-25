# Healthcare DICOM Store IAM — role attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_dicom_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-dicom-store"
}

resource "google_healthcare_dicom_store_iam_member" "nc" {
  dataset        = google_healthcare_dataset.nc.id
  dicom_store_id = google_healthcare_dicom_store.nc.name
  member         = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad project-wide permissions
  role = "roles/editor"
}
