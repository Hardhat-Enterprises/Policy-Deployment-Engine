resource "google_compute_resource_policy" "compliant_example_1" {
  name   = "compliant-example-1"
  region = "us-central1"
  deletion_policy = "PREVENT"
}
resource "google_compute_resource_policy" "compliant_example_2" {
  name         = "compliant_example_2"
  zone         = "us-central1-a"
  source_disk  = "projects/fake-project/zones/us-central1-a/disks/fake-disk"
  deletion_policy = "ABANDON"
}