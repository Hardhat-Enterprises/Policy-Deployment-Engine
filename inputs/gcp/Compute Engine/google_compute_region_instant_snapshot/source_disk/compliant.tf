resource "google_compute_region_instant_snapshot" "compliant_example_1" {
  name        = "compliant-instant-snapshot"
  region      = "us-central1"
  source_disk = "projects/approved-project/regions/us-central1/disks/approved-disk"
}
