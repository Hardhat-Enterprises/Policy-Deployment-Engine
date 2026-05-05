# Healthcare DICOM Store — notification_config attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_dicom_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-dicom-store"

  # COMPLIANT: notification_config set — DICOM store operations publish to Pub/Sub for audit
  notification_config {
    pubsub_topic = "projects/my-project/topics/healthcare-dicom-notifications"
  }

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
