resource "google_beyondcorp_app_connection" "non_compliant_example_1" {
  name    = "non_compliant_example_1"
  project = "smooth-verve-467716-v1"
  type    = "HTTP_PROXY"
  region  = "australia-southeast1"

  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
