resource "google_apigee_api_product" "nc" {
  org_id        = ""
  name          = "my-api-product-nc"
  display_name  = ""

  approval_type = "auto"
  environments = ["prod"]
}