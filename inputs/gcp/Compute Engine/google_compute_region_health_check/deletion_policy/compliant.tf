resource "google_compute_region_health_check" "compliant_example_1" {
  name            = "compliant-deletion-policy-health-check"
  deletion_policy = "DELETE"

  http_health_check {
    port = 80
  }
}