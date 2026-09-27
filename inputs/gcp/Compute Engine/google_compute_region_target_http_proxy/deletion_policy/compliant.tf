resource "google_compute_region_target_http_proxy" "compliant_example_1" {
  name            = "compliant-example-1"
  region          = "australia-southeast1"
  url_map         = "projects/example-project/regions/australia-southeast1/urlMaps/example-url-map"
  deletion_policy = "PREVENT"
}
