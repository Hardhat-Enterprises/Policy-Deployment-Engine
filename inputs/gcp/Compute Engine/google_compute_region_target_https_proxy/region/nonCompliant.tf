resource "google_compute_region_target_https_proxy" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  region   = "us-central1"
  url_map  = "projects/my-project/regions/us-central1/urlMaps/my-url-map"
}