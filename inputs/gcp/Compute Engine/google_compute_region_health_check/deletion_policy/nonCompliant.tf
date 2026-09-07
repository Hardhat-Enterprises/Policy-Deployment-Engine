resource "google_compute_region_health_check" "non_compliant_example_1" {
  name            = "noncompliant-deletion-policy-health-check"
  deletion_policy = "ABANDON"

  http_health_check {
    port = 80
  }
}