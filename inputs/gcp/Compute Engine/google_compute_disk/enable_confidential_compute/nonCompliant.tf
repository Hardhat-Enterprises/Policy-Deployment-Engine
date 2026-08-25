resource "google_compute_disk" "non_compliant_example_1" {
  name                       = "non-compliant-example-1"
  zone                       = "australia-southeast1-a"
  type                       = "hyperdisk-balanced"
  enable_confidential_compute = false
}