resource "google_compute_disk" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  zone     = "australia-southeast1-a"
  type     = "pd-ssd"
  snapshot = "projects/my-project/global/snapshots/my-encrypted-snapshot"

  source_snapshot_encryption_key {
    raw_key = "SGVsbG8gZnJvbSBHb29nbGUgQ2xvdWQgUGxhdGZvcm0="
  }
}