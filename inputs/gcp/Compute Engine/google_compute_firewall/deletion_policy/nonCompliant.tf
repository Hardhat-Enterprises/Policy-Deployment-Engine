resource "google_compute_firewall" "non_compliant_example_1" {
  project = "gcp-project-12345"
  name    = "fw-noncompliant-1"
  source_ranges = ["10.0.0.0/8"]
  network = "fake-network"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  deletion_policy = "DELETE"
}
