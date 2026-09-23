# google_compute_region_backend_service: log_config.enable
# Non-compliant when load balancer traffic logging is off.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  log_config {
    enable = false
  }
}
