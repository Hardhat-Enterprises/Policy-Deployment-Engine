resource "google_app_engine_application" "non_compliant" {
  location_id = "europe-west2"  # Assume we want to deny this region
}