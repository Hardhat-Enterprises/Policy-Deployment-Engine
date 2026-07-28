resource "google_beyondcorp_app_gateway" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project = "smooth-verve-467716-v1"
  region = "australia-southeast1"
  type = "TCP_PROXY"
  host_type = "HOST_TYPE_UNSPECIFIED"
}
