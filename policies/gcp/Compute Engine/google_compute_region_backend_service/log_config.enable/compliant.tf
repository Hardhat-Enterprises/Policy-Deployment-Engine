# google_compute_region_backend_service: log_config.enable
# Compliant when load balancer traffic logging is on.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name = "compliant-example-1"

  log_config {
    enable = true
  }
}
