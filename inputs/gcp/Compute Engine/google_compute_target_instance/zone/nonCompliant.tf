resource "google_compute_target_instance" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  instance        = "example-instance"
  zone            = "us-central1-a"
  deletion_policy = "PREVENT"
}
