# google_compute_region_backend_service: iap.enabled
# Non-compliant when IAP is configured but switched off.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  iap {
    enabled = false
  }
}
