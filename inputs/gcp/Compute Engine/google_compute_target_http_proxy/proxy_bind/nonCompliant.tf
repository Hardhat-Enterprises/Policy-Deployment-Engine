# Target HTTP Proxy with proxy_bind enabled.
# Label the resource(s) under test non_compliant_example_1, non_compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.

resource "google_compute_target_http_proxy" "non_compliant_example_1" {
  name       = "non_compliant_example_1"
  url_map    = "https://www.googleapis.com/compute/v1/projects/example-project/global/urlMaps/example-url-map"
  proxy_bind = true
}
