resource "google_apigee_api" "c" {
  name          = "c"
  org_id        = "PDE-API-Proxy"
  config_bundle = "proxies/MyProxy.zip"
}