resource "google_beyondcorp_app_gateway" "c" {
  name = "c-hosttype-ok"
  region = "australia-southeast1"
  type = "TCP_PROXY"
  host_type = "GCP_REGIONAL_MIG"
}
