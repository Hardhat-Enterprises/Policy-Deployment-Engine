resource "google_dataflow_flex_template_job" "c" {
  provider                = google-beta
  name                    = "c"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  service_account_email = "dataflow-sa@my-project.iam.gserviceaccount.com"
}