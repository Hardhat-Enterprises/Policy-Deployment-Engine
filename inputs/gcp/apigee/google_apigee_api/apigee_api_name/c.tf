resource "google_apigee_api" "api_proxy" {
  name          = "proxy1"
  org_id        = var.org_id
  config_bundle = data.archive_file.bundle.output_path
}