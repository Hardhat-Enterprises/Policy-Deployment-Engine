# This resource is compliant because it follows naming conventions, uses allowed location, and sets labels

resource "google_apihub_api_hub_instance" "c" {
  api_hub_instance_id = "compliant-instance"
  location            = "us-central1"
  description         = "Compliant API Hub instance"

  config {
    encryption_type = "CMEK"
    cmek_key_name   = "projects/focus-dragon-406513-m2/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key"
    disable_search  = false
    vertex_location = "us"
  }

  labels = {
    environment = "dev"
  }
}
