resource "google_beyondcorp_app_gateway" "c" {
  name = "my-app-gateway"
  type = "TCP_PROXY"
  host_type = "GCP_REGIONAL_MIG"
}

resource "google_beyondcorp_app_connection" "c" {
  name   = "c-gateway-ok"
  type   = "TCP_PROXY"
  region = "australia-southeast1"
  application_endpoint {
     host = "svc.internal" 
     port = 443 
  }
  gateway {
    app_gateway = "projects/my-proj/locations/australia-southeast1/appgateways/app-gateway-1"
  }
}
