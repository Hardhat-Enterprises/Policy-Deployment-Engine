resource "google_compute_region_health_check" "compliant_example_1" {
  name = "compliant-log-config-health-check"

  http_health_check {
    port = 80
  }

  log_config {
    enable = true
  }
}