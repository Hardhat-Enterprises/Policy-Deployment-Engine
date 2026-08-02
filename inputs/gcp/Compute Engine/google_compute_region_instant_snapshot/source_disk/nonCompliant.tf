resource "google_compute_region_instant_snapshot" "non_compliant_example_1" {
  name        = "noncompliant-instant-snapshot"
  region      = "us-central1"
  source_disk = "projects/untrusted-project/regions/us-central1/disks/untrusted-disk"
}
