
resource "google_beyondcorp_app_gateway" "nc" {
  name         = "nc"
  project      = "smooth-verve-467716-v1"
  type         = "TCP_PROXY"
  host_type    = "GCP_REGIONAL_MIG"
  region       = "us-central1"
}
