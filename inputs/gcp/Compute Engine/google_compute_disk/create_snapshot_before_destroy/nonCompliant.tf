resource "google_compute_disk" "non_compliant_example_1" {
  name                           = "non-compliant-example-1"
  zone                           = "us-central1-a"
  create_snapshot_before_destroy  = false
}