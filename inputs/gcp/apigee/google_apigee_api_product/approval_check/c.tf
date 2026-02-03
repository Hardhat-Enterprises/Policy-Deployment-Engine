resource "google_apigee_api_product" "c" {
  org_id        = "PDE_Apigee_API_Product"
  name          = "my-api-product-c"
  display_name  = "My Basic API Product"

  approval_type = "manual"
  proxies = ["proxies-compliant"]
  environments = ["Production"]
}