# google_compute_region_backend_service: cdn_policy.cache_key_policy.include_host
# Non-compliant when different hosts can share the same cache entry.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  enable_cdn = true

  cdn_policy {
    cache_key_policy {
      include_host = false
    }
  }
}
