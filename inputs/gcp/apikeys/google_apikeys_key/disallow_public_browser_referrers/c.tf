# Compliant example for disallow_public_browser_referrers

resource "google_apikeys_key" "c" {
  name         = "apikey_browser_referrer_compliant"
  display_name = "Compliant browser key (no public referrers)"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }

    browser_key_restrictions {
      allowed_referrers = [
        "https://example.com/*"
      ]
    }
  }
}
