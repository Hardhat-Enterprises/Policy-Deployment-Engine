# google_compute_region_backend_service: log_config.sample_rate
# Non-compliant when the sample rate is 0, which silences logging even though it is enabled.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  log_config {
    enable      = true
    sample_rate = 0
  }
}
