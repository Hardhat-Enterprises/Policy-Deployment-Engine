# google_compute_region_backend_service: cdn_policy.cache_mode
# Non-compliant when the cache mode ignores the origin's cache-control headers entirely.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  enable_cdn = true

  cdn_policy {
    cache_mode = "FORCE_CACHE_ALL"

    cache_key_policy {
      include_host = true
    }
  }
}
