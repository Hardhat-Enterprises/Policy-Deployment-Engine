resource "google_compute_backend_bucket" "compliant_example_1" {
  name        = "compliant-example-1"
  bucket_name = "compliant-example-bucket"
  enable_cdn  = true

  cdn_policy {
    signed_url_cache_max_age_sec = 3600
  }
}