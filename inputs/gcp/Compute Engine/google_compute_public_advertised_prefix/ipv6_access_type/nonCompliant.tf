resource "google_compute_public_advertised_prefix" "non_compliant_example_1" {
  name             = "non-compliant-example-1"
  ip_cidr_range    = "2001:db8::/32"
  pdp_scope        = "REGIONAL"
  ipv6_access_type = "EXTERNAL"
}
