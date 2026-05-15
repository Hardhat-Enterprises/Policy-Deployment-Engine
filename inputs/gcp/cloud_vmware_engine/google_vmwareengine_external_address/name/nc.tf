
resource "google_vmwareengine_external_address" "nc" {
  name        = "nc"
  parent      = "projects/599444694846/locations/us-west1-a/privateClouds/nc"
  internal_ip = "192.168.0.66"
  description = "nc"

}