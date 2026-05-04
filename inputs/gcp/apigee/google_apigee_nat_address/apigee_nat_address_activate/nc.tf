resource "google_apigee_nat_address" "nc" {
  name        = "nc"
  instance_id = "organizations/pde-org/instances/pde-instance"
  activate    = false
}