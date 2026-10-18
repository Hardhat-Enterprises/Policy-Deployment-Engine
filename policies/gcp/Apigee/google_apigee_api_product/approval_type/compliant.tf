resource "google_apigee_api_product" "compliant_example_1" {
  org_id        = "PDE_Apigee_API_Product"
  name          = "compliant_example_1"
  display_name  = "My Basic API Product"

  approval_type = "manual"
  proxies = ["proxies-compliant"]
  environments = ["Production"]
}
