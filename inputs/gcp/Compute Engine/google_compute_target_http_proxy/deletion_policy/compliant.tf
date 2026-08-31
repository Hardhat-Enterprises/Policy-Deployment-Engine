# Target HTTP Proxy using an approved deletion policy.
# Label the resource(s) under test compliant_example_1, compliant_example_2, ...
# Only the tested resource type may appear in this file.

resource "google_compute_target_http_proxy" "compliant_example_1" {
  name            = "compliant_example_1"
  url_map         = "https://www.googleapis.com/compute/v1/projects/example-project/global/urlMaps/example-url-map"
  deletion_policy = "PREVENT"
}
