# This resource is intentionally non-compliant to test policy rules

resource "google_apihub_api_hub_instance" "nc" {
  api_hub_instance_id = "Bad_Instance" # Invalid casing
  location            = "europe-west1" # Non-allowed location
  description         = "Non-compliant API Hub instance"

  config {
    encryption_type = "GMEK"  # Policy requires CMEK
    disable_search  = true    # Policy requires search enabled
  }

  labels = {
    owner = "test-user"       # Missing required "environment" label
  }
}
