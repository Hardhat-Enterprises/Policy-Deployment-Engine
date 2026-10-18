resource "google_compute_router" "non_compliant_example_1" {
  name    = "noncompliant-router"
  region  = "us-central1"
  network = "default"
}