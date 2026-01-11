resource "google_apigee_api_product" "nc" {
  org_id        = "PDE_Apigee_API_Product"
  name          = "my-api-product-nc"
  display_name  = "My Basic API Product"

  approval_type = ""
  environments = ["prod"]
}