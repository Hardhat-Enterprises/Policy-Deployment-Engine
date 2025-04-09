resource "google_app_engine_application" "compliant" {
  project     = var.project_id
  location_id = "australia-southeast2" # Compliant
}