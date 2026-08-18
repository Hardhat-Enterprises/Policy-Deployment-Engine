# Non-compliant example for disallow_public_browser_referrers

resource "google_apikeys_key" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  display_name = "Non-compliant browser key (public referrers)"
  project = "my-gcp-project"
  
  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }

    browser_key_restrictions {
      allowed_referrers = [
        "*",
        "https://example.com/*"
      ]
    }
  }
}
