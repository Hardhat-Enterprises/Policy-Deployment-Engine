resource "google_vmwareengine_subnet" "c" {
  name          = "c"
  parent        = "projects/599444694846/locations/us-west1-a/privateClouds/c"
  ip_cidr_range = "192.168.100.0/26"
}