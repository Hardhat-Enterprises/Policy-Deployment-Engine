resource "google_compute_instance_group_named_port" "non_compliant_example_1" {
  group           = "example-instance-group"
  name            = "non-compliant-zone-example-1"
  port            = 8080
  zone            = "us-east1-b"
  deletion_policy = "PREVENT"
}