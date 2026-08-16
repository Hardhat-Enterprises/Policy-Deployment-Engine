resource "google_compute_instant_snapshot" "compliant_example_1" {
  name         = "compliant_example_1"
  zone         = "us-central1-a"
  source_disk  = google_compute_disk.foo_compliant_1.self_link
  deletion_policy = "PREVENT"
}