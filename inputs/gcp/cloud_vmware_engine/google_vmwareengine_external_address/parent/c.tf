
resource "google_vmwareengine_external_address" "c" {
  name        = "c"
  parent      = "projects/599444694846/locations/us-west1-a/privateClouds/c"
  internal_ip = "192.168.0.66"
  description = "c"

}