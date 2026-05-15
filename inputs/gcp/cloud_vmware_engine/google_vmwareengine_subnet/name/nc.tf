resource "google_vmwareengine_subnet" "nc" {
  name          = "nc"
  parent        = "projects/599444694846/locations/us-west1-a/privateClouds/nc"
  ip_cidr_range = "192.168.100.0/26"
}