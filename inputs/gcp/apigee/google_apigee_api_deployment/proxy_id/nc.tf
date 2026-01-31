resource "google_apigee_api" "apigee_api_proxy_nc" {
  name            = "apigee-proxy-nc"
  org_id          = "Test"
  config_bundle   = "random/Apigee_Proxies.zip"
}

resource "google_apigee_api_deployment" "apigee_api_deployment_nc" {
  environment = "Prod"
  org_id = "Test"
  revision = google_apigee_api.apigee_api_proxy_nc.latest_revision_id
  proxy_id = google_apigee_api.apigee_api_proxy_nc.name
}