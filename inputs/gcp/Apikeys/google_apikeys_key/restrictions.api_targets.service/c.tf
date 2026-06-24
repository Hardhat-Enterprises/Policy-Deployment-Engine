# Compliant — a single key that satisfies every merged scenario
# (restrictions present AND api_targets.service is an approved service)
resource "google_apikeys_key" "c1" {
  name         = "c1"
  display_name = "Compliant API key (restricted to an approved service)"
  project      = "my-gcp-project"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
