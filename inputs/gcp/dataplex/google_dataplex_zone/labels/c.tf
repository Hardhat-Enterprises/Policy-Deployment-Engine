resource "google_dataplex_zone" "c" {
  name     = "zone-compliant"
  project  = "my-project"
  location = "us-central1"
  lake     = "example-lake"
  type     = "RAW"

  labels = {
    environment = "prod"
    owner       = "security-team"
  }
    discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }


}

