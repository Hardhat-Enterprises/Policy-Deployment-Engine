resource "google_apigee_api_product" "c" {
  org_id       = "PDE_Apigee_API_Product"
  name         = "c"
  display_name = "My Basic API Product"

  approval_type = "auto"
  api_resources = ["/weather/**"]
  proxies       = ["proxies-compliant"]
  environments  = ["Production"]
}