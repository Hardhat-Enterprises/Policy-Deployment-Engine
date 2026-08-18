resource "google_apigee_api_deployment" "compliant_example_1" {
  environment = "Production"
  org_id = "PDE-Apigee-Project"
  revision = "1"
  proxy_id = "apigee-proxy-c"
}
