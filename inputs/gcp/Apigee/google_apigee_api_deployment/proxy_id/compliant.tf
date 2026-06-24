resource "google_apigee_api" "apigee_api_proxy_c" {
  name            = "apigee-proxy-c"
  org_id          = "PDE-Apigee-Project"
  config_bundle   = "proxies/Apigee_Proxies.zip"
}

resource "google_apigee_api_deployment" "c" {
  environment = "Production"
  org_id = "PDE-Apigee-Project"
  revision = google_apigee_api.apigee_api_proxy_c.latest_revision_id
  proxy_id = google_apigee_api.apigee_api_proxy_c.name
}