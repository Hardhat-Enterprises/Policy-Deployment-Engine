# Non-compliant — one per merged scenario
# nc1: scenario 1 — api_targets.service is not in the approved list
resource "google_apikeys_key" "nc1" {
  name         = "nc1"
  display_name = "Non-compliant API key (unapproved service)"
  project      = "my-gcp-project"

  restrictions {
    api_targets {
      service = "storage.googleapis.com"
    }
  }
}

# nc2: scenario 2 — no key restrictions configured
resource "google_apikeys_key" "nc2" {
  name         = "nc2"
  display_name = "Non-compliant API key (no restrictions)"
  project      = "my-gcp-project"

  restrictions {
  }
}
