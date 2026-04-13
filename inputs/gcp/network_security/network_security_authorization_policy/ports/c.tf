resource "google_network_security_authorization_policy" "c" {
  provider = google-beta

  project          = "123"
  name             = "c"
  location         = "global"
  action           = "ALLOW"

  rules {
    destinations {
      hosts   = ["example.com"]
      ports   = [443]
      methods = ["GET"]
    }
  }
}