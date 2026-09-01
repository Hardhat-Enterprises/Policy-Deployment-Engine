resource "google_compute_disk" "compliant_example_1" {
  name                           = "compliant-example-1"
  zone                           = "us-central1-a"
  create_snapshot_before_destroy  = true
}