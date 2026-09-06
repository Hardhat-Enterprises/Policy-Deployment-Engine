resource "google_compute_region_health_source" "non_compliant_example_1" {
  name             = "noncompliant-health-source"
  region           = "us-central1"
  source_type      = "BACKEND_SERVICE"
  deletion_policy  = "DELETE"
}
