resource "google_dataflow_flex_template_job" "c" {
  provider                = google-beta
  name                    = "c"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  # Target attribute: ip_configuration = WORKER_IP_PRIVATE
  ip_configuration = "WORKER_IP_PRIVATE"
}