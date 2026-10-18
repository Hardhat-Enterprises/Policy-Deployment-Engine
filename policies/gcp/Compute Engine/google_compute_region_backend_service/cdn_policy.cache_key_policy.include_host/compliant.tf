# google_compute_region_backend_service: cdn_policy.cache_key_policy.include_host
# Compliant when different hosts are cached separately.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name       = "compliant-example-1"
  enable_cdn = true

  cdn_policy {
    cache_key_policy {
      include_host = true
    }
  }
}
