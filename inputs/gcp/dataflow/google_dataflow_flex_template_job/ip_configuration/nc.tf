resource "google_dataflow_flex_template_job" "nc" {
  name                    = "nc"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  # VIOLATION: ip_configuration = WORKER_IP_PUBLIC
  ip_configuration = "WORKER_IP_PUBLIC"
}