resource "google_beyondcorp_app_gateway" "nc" {
  name      = "nc-type-bad"
  region    = "australia-southeast1"
  type      = "TYPE_UNSPECIFIED"
  host_type = "GCP_REGIONAL_MIG"
}
