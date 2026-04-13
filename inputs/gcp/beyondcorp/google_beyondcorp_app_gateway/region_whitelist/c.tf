
resource "google_beyondcorp_app_gateway" "c" {
  name      = "c"
  project   = "smooth-verve-467716-v1"
  type      = "TCP_PROXY"
  host_type = "GCP_REGIONAL_MIG"
  region    = "australia-southeast1"
  labels = {
    owner = "platform"
  }
}
