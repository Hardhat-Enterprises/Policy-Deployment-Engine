resource "google_compute_region_health_check" "non_compliant_example_1" {
  name = "noncompliant-log-config-health-check"

  http_health_check {
    port = 80
  }

  log_config {
    enable = false
  }
}