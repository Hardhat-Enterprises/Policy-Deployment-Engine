resource "google_dataflow_job" "nc" {
  name              = "nc"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://my-bucket/temp"

  # VIOLATION: service_account_email not set (uses default Compute Engine SA)
}