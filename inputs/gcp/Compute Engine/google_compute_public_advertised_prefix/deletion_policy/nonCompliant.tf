resource "google_compute_public_advertised_prefix" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  ip_cidr_range   = "192.0.2.0/24"
  deletion_policy = "ABANDON"
}
