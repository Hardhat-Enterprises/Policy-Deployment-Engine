resource "google_compute_backend_bucket" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  bucket_name = "non-compliant-example-bucket"
  enable_cdn  = true

  cdn_policy {
    signed_url_cache_max_age_sec = 86400
  }
}