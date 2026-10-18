# Non-compliant example for google_compute_instance_group_named_port.
# DELETE allows Terraform to destroy the resource.

resource "google_compute_instance_group_named_port" "non_compliant_example_1" {
  group           = "example-instance-group"
  name            = "non-compliant-example-1"
  port            = 8080
  zone            = "us-central1-a"
  deletion_policy = "DELETE"
}