resource "google_compute_router" "compliant_example_1" {
  name    = "compliant-router"
  region  = "australia-southeast2"
  network = "default"
}