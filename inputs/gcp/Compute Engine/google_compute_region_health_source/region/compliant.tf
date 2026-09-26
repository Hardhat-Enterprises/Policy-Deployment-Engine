resource "google_compute_region_health_source" "compliant_example_1" {
  name        = "compliant-health-source"
  region      = "us-central1"
  source_type = "BACKEND_SERVICE"
}
