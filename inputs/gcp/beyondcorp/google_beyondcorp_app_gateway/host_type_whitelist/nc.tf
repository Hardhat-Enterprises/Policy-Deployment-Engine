
resource "google_beyondcorp_app_gateway" "nc" {
  name = "nc"
  project = "smooth-verve-467716-v1"
  region = "australia-southeast1"
  type = "TCP_PROXY"
  host_type = "HOST_TYPE_UNSPECIFIED"
}
