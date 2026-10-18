resource "google_apigee_nat_address" "compliant_example_1" {
  name        = "compliant_example_1"
  instance_id = "organizations/pde-org/instances/pde-instance"
  activate    = "true"
}
