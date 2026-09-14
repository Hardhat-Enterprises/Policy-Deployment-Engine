resource "google_compute_region_health_check" "compliant_example_1" {
  name   = "compliant-region-health-check"
  region = "australia-southeast2"

  http_health_check {
    port = 80
  }
}