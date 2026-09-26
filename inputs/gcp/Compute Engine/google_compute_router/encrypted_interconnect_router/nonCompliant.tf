resource "google_compute_router" "non_compliant_example_1" {
  name                          = "noncompliant-encrypted-router"
  region                        = "australia-southeast2"
  network                       = "default"
  encrypted_interconnect_router = false
}