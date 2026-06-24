resource "google_apigee_api" "compliant_example_1" {
  name          = "compliant_example_1"
  org_id        = "PDE-API-Proxy"
  config_bundle = "proxies/MyProxy.zip"
}
