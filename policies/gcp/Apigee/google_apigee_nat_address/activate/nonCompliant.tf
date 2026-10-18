resource "google_apigee_nat_address" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  instance_id = "organizations/pde-org/instances/pde-instance"
  activate    = "false"
}
