resource "google_beyondcorp_app_gateway" "c" {
  name         = "c-region-ok"
  type         = "TCP_PROXY"
  host_type    = "GCP_REGIONAL_MIG"
  region       = "australia-southeast1"
  display_name = "Gateway in approved region"
  labels = { 
    owner = "platform" 
  }
}
