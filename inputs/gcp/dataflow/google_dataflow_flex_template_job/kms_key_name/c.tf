resource "google_dataflow_flex_template_job" "c" {
  name                    = "c"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  # Target attribute: kms_key_name configured
  kms_key_name = "projects/my-project/locations/us-central1/keyRings/my-keyring/cryptoKeys/my-key"
}