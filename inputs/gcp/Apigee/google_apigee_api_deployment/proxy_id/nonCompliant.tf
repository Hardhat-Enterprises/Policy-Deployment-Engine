resource "google_apigee_api_deployment" "non_compliant_example_1" {
  environment = "Prod"
  org_id = "Test"
  revision = "1"
  proxy_id = "apigee-proxy-nc"
}
