resource "google_compute_target_instance" "compliant_example_1" {
  name            = "compliant-example-1"
  instance        = "example-instance"
  zone            = "australia-southeast1-a"
  deletion_policy = "PREVENT"
}
