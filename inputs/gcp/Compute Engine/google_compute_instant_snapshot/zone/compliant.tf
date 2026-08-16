resource "google_compute_instant_snapshot" "compliant_example_1" {
  name         = "compliant_example_1"
  zone         = "australia-southeast1-a"
  source_disk  = google_compute_disk.foo_compliant_1.self_link
}