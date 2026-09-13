# Non-compliant — one per merged scenario
# nc1: scenario 1 — api_targets.service is not in the approved list
resource "google_apikeys_key" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  display_name = "Compliant API key (restricted to an approved service)"
  project      = "my-gcp-project"

  restrictions {
    api_targets {
      service = "storage.googleapis.com"
    }
  }
}

# nc2: scenario 2 — no key restrictions configured
resource "google_apikeys_key" "non_compliant_example_2" {
  name         = "non_compliant_example_2"
  display_name = "Compliant API key (restricted to an approved service)"
  project      = "my-gcp-project"

  restrictions {
  }
}
