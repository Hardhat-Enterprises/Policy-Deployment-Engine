resource "google_compute_firewall" "compliant_example_1" {
  project = "gcp-project-12345"
  name    = "fw-compliant-1"
  source_ranges = ["10.0.0.0/8"]
  network = "projects/fake-project/global/networks/fake-network"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  enable_logging = true
}
