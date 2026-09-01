resource "google_compute_region_health_aggregation_policy" "non_compliant_example_1" {
  name             = "noncompliant-health-agg-policy"
  region           = "us-central1"
  deletion_policy  = "DELETE"
}
