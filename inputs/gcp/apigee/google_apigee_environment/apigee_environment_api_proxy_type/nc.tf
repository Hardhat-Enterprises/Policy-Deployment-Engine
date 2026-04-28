resource "google_apigee_environment" "nc" {
  name           = "nc"
  description    = "Apigee Environment"
  display_name   = "non-compliant-environment"
  org_id         = "organizations/pde-org"
  api_proxy_type = "API_PROXY_TYPE_UNSPECIFIED"
}