resource "google_compute_instant_snapshot" "compliant_example_1" {
  name         = "compliant_example_1"
  zone         = "us-central1-a"
  source_disk  = "projects/fake-project/zones/us-central1-a/disks/fake-disk"
  deletion_policy = "PREVENT"
}