resource "google_compute_region_health_check" "non_compliant_example_1" {
  name   = "noncompliant-region-health-check"
  region = "us-central1"

  http_health_check {
    port = 80
  }
}