resource "google_beyondcorp_app_gateway" "nc" {
  name = "my-app-gateway"
  type = "TCP_PROXY"
  host_type = "GCP_REGIONAL_MIG"
}

resource "google_beyondcorp_app_connection" "nc" {
  name   = "nc-gateway-ok"
  type   = "TCP_PROXY"
  region = "australia-southeast1"
  application_endpoint {
     host = "svc.internal" 
     port = 443 
  }
  gateway {
    app_gateway = "projects/other-proj/locations/us-central1/appgateways/unapproved-gateway-1"
  }
}
