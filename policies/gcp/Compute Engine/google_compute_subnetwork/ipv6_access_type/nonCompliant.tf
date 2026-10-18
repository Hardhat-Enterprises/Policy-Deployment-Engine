resource "google_compute_subnetwork" "non_compliant_example_1" {
  name             = "non-compliant-example-1"
  project          = "pde-project"
  network          = "default"
  ip_cidr_range    = "10.10.0.0/24"
  region           = "australia-southeast1"
  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL"
}
