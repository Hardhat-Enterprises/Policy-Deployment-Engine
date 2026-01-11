resource "google_apigee_api" "c" {
  name          = "proxy1"
  org_id        = "PDE-API-Proxy"
  config_bundle = "proxies/MyProxy.zip"
}