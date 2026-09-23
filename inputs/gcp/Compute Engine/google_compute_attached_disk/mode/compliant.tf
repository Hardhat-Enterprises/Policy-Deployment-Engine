resource "google_compute_attached_disk" "compliant_example_1" {
  disk     = "example-disk"
  instance = "example-instance"
  project  = "pde-test-project-01"
  zone     = "australia-southeast1-a"
  mode     = "READ_ONLY"
}