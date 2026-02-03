# Non-compliant example for disallow_public_server_ips

resource "google_apikeys_key" "nc" {
  name         = "apikey_server_ips_non_compliant"
  display_name = "Non-compliant server key (public IP range)"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }

    server_key_restrictions {
      allowed_ips = [
        "0.0.0.0/0",
        "10.0.0.0/8"
      ]
    }
  }
}
