resource "google_dataflow_job" "c" {
  name              = "c"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://my-bucket/temp"

  ip_configuration = "WORKER_IP_PRIVATE"
}