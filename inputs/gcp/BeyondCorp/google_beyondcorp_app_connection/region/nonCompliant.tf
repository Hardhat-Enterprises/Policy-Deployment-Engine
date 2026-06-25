resource "google_beyondcorp_app_connection" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project = "smooth-verve-467716-v1"
  type = "TCP_PROXY"
  region = "us-central1"
  application_endpoint {
    host = "svc.internal-bad"
    port = 8081
  }
}
