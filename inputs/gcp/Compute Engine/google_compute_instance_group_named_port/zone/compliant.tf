resource "google_compute_instance_group_named_port" "compliant_example_1" {
  group           = "example-instance-group"
  name            = "compliant-zone-example-1"
  port            = 8080
  zone            = "us-central1-a"
  deletion_policy = "PREVENT"
}