resource "google_beyondcorp_app_gateway" "nc" {
  name = "nc-hosttype-bad"
  region = "australia-southeast1"
  type = "TCP_PROXY"
  host_type = "HOST_TYPE_UNSPECIFIED"
}
