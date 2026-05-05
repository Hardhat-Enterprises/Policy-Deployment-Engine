# Healthcare DICOM Store - notification_config (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_dicom_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc"

  # VIOLATION: No notification_config block — DICOM store operations are not
  # published to Pub/Sub, making it impossible to audit medical imaging data access
}
