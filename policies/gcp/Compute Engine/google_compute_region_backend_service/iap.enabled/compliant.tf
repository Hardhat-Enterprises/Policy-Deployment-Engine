# google_compute_region_backend_service: iap.enabled
# Compliant when Identity-Aware Proxy is switched on.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name = "compliant-example-1"

  iap {
    enabled = true
  }
}
