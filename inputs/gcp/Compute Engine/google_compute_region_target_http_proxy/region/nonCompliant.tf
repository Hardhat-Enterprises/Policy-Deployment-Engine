resource "google_compute_region_target_http_proxy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  region          = "us-central1"
  url_map         = "projects/example-project/regions/australia-southeast1/urlMaps/example-url-map"
  deletion_policy = "PREVENT"
}
