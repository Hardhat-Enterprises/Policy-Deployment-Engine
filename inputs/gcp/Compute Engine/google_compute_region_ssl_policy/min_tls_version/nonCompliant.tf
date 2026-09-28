resource "google_compute_region_ssl_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  region          = "australia-southeast1"
  profile         = "MODERN"
  min_tls_version = "TLS_1_0"
}
