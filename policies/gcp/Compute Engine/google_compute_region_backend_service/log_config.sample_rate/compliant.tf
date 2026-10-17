# google_compute_region_backend_service: log_config.sample_rate
# Compliant when logging samples a non-zero share of requests.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name = "compliant-example-1"

  log_config {
    enable      = true
    sample_rate = 1
  }
}
