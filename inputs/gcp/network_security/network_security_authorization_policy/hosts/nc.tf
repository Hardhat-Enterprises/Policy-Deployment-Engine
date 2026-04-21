resource "google_network_security_authorization_policy" "nc" {

  provider = google-beta
  project  = "123"
  name     = "nc"

  action = "DENY"

  rules {
    destinations {
      hosts   = ["name.com"]
      ports   = [80]
      methods = ["GET"]
    }
  }
}