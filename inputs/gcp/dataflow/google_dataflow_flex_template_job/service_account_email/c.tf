resource "google_dataflow_flex_template_job" "c" {
  name                    = "c"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  # Target attribute: dedicated service account configured
  service_account_email = "dataflow-sa@my-project.iam.gserviceaccount.com"
}