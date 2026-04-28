resource "google_apigee_environment" "c" {
  name         = "c"
  description  = "Apigee Environment"
  display_name = "compliant-environment"
  org_id       = "organizations/pde-org"
  type         = "INTERMEDIATE"
}