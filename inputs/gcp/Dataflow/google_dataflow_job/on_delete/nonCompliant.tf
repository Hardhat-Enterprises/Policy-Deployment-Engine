resource "google_dataflow_job" "non_compliant_example_1" {
  name              = "non_compliant_example_1"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://my-bucket/temp"

  on_delete = "cancel"
}
