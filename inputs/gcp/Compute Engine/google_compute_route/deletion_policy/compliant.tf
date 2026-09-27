resource "google_compute_route" "compliant_example_1" {
  name             = "compliant-example-1"
  network          = "default"
  dest_range       = "10.0.0.0/24"
  next_hop_gateway = "default-internet-gateway"
  deletion_policy  = "PREVENT"
}