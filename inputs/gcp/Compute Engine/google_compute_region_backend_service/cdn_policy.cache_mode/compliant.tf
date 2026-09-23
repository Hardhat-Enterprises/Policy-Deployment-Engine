# google_compute_region_backend_service: cdn_policy.cache_mode
# Compliant when the cache mode respects the origin's own cache-control headers.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name       = "compliant-example-1"
  enable_cdn = true

  cdn_policy {
    cache_mode = "USE_ORIGIN_HEADERS"

    cache_key_policy {
      include_host = true
    }
  }
}
