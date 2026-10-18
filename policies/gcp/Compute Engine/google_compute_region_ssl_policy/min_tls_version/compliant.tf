resource "google_compute_region_ssl_policy" "compliant_example_1" {
  name            = "compliant-example-1"
  region          = "australia-southeast1"
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}
