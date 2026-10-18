resource "google_compute_target_instance" "compliant_example_1" {
  name            = "compliant-example-1"
  instance        = "projects/example-project/zones/australia-southeast1-a/instances/example-instance"
  zone            = "australia-southeast1-a"
  deletion_policy = "PREVENT"
}
