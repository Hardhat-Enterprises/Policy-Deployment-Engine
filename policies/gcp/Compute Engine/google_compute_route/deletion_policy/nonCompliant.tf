resource "google_compute_route" "non_compliant_example_1" {
  name             = "non-compliant-example-1"
  network          = "default"
  dest_range       = "10.0.0.0/24"
  next_hop_gateway = "default-internet-gateway"
  deletion_policy  = "DELETE"
}