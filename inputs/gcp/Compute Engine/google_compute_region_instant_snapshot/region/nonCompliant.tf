resource "google_compute_region_instant_snapshot" "non_compliant_example_1" {
  name        = "noncompliant-instant-snapshot"
  region      = "europe-west1"
  source_disk = "projects/fake-project/regions/us-central1/disks/fake-disk"
}
