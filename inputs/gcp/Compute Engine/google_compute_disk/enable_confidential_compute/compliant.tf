resource "google_compute_disk" "compliant_example_1" {
  name                        = "compliant-example-1"
  zone                        = "australia-southeast1-a"
  enable_confidential_compute = true
}