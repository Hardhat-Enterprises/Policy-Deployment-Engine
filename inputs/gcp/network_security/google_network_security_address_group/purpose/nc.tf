resource "google_network_security_address_group" "nc" {

  provider = google-beta
  name     = "nc"
  parent   = "projects/123"
  location = "global"
  type     = "IPV4"
  capacity = 100
  purpose  = ["DEFAULT"]
}