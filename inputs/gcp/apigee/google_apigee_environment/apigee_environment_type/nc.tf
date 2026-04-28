resource "google_apigee_environment" "nc" {
  name         = "nc"
  description  = "Apigee Environment"
  display_name = "non-compliant-environment"
  org_id       = "organizations/pde-org"
  type         = "ENVIRONMENT_TYPE_UNSPECIFIED"
}