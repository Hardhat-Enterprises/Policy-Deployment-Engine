resource "google_dataflow_flex_template_job" "nc" {
  provider                = google-beta
  name                    = "nc"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  # VIOLATION: service_account_email not set (uses default Compute Engine SA)
}