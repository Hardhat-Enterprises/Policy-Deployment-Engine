resource "google_dataflow_job" "compliant_example_1" {
  name              = "compliant_example_1"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://my-bucket/temp"

  kms_key_name = "projects/my-project/locations/us-central1/keyRings/my-keyring/cryptoKeys/my-key"
}
