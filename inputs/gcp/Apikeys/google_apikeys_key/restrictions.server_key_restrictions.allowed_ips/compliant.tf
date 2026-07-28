# Compliant example for disallow_public_server_ips

resource "google_apikeys_key" "compliant_example_1" {
  name         = "compliant_example_1"
  display_name = "Compliant server key (restricted IPs)"

  project = "my-gcp-project"
  
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
