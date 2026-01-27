# Compliant example for disallow_public_server_ips

resource "google_apikeys_key" "c" {
  name         = "apikey-server-ips-compliant"
  display_name = "Compliant server key (restricted IPs)"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }

    server_key_restrictions {
      allowed_ips = [
        "10.0.0.0/8"
      ]
    }
  }
}
