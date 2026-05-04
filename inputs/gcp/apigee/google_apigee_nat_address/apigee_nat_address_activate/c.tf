resource "google_apigee_nat_address" "c" {
  name        = "c"
  instance_id = "organizations/pde-org/instances/pde-instance"
  activate    = true
}