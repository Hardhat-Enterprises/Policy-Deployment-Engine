resource "google_dataflow_flex_template_job" "c" {
  name                    = "c"
  container_spec_gcs_path = "gs://my-bucket/templates/my-flex-template.json"

  # Target attribute: network = approved VPC
  network = "projects/my-project/global/networks/approved-vpc"
}