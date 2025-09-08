resource "google_beyondcorp_app_gateway" "nc" {
  name         = "nc-region-bad"
  type         = "TCP_PROXY"
  host_type    = "GCP_REGIONAL_MIG"
  region       = "us-central1"
  display_name = "Gateway in unapproved region"
}
