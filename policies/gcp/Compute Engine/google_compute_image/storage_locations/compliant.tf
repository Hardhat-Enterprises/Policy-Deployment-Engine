resource "google_compute_image" "compliant_example_1" {
  name              = "compliant-example-1"
  source_disk       = "projects/pde-demo/zones/us-central1-a/disks/example-disk"
  storage_locations = ["australia-southeast1"]
}