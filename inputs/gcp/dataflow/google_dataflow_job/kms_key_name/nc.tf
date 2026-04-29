resource "google_dataflow_job" "nc" {
  name              = "nc"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://my-bucket/temp"

  # VIOLATION: kms_key_name not set (uses Google-managed keys)
}