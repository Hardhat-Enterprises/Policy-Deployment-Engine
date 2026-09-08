resource "google_apigee_api_deployment" "non_compliant_example_1" {
  environment = "Production"
  org_id = "PDE-Apigee-Project"
  revision = "1"
  proxy_id = "apigee-proxy-nc"
}
