# Healthcare DICOM Store - notification_config (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dicom_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"

  # COMPLIANT: notification_config set — DICOM store operations publish to
  # Pub/Sub enabling real-time audit of medical imaging data access
  notification_config {
    pubsub_topic = "projects/my-project/topics/healthcare-dicom-notifications"
  }
}
