resource "google_compute_router" "compliant_example_1" {
  name                          = "compliant-encrypted-router"
  region                        = "australia-southeast2"
  network                       = "default"
  encrypted_interconnect_router = true
}