resource "google_compute_instant_snapshot" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  zone         = "us-central1-a"
  source_disk  = google_compute_disk.foo.self_link
  deletion_policy = "DELETE"
}