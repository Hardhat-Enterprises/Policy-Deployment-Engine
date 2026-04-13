resource "google_apigee_api_product" "nc" {
  org_id       = "PDE_Apigee_API_Product"
  name         = "nc"
  display_name = "My Basic API Product"

  approval_type = "auto"
  proxies       = ["proxies-noncompliant"]
  environments  = ["Production"]
}