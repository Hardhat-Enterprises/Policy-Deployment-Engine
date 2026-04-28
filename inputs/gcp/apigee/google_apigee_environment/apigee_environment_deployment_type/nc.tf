resource "google_apigee_environment" "nc" {
  name            = "nc"
  description     = "Apigee Environment"
  display_name    = "non-compliant-environment"
  org_id          = "organizations/pde-org"
  deployment_type = "DEPLOYMENT_TYPE_UNSPECIFIED"
}