# Healthcare DICOM Store - notification_config (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dicom_store" "non_compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "non_compliant_example_1"

  # VIOLATION: No notification_config block — DICOM store operations are not
  # published to Pub/Sub, making it impossible to audit medical imaging data access
}
