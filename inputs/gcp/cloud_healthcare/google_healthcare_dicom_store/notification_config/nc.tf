# Healthcare DICOM Store — notification_config attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_dicom_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-dicom-store"

  # VIOLATION: No notification_config — DICOM store operations are not published
  # to Pub/Sub, making it impossible to audit access to medical imaging data

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
