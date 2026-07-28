# Non-compliant example for disallow_public_server_ips

resource "google_apikeys_key" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  display_name = "Non-compliant server key (public IP range)"
  project = "my-gcp-project"
  
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
