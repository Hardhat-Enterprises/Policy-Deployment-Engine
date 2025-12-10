# Non-compliant example for disallow_public_browser_referrers

resource "google_apikeys_key" "nc" {
  name         = "apikey-browser-referrer-non-compliant"
  display_name = "Non-compliant browser key (public referrers)"

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
