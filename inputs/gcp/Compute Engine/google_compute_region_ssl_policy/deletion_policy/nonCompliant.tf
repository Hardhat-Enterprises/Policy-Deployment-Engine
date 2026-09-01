resource "google_compute_region_ssl_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  region          = "australia-southeast1"
  deletion_policy = "ABANDON"
}
