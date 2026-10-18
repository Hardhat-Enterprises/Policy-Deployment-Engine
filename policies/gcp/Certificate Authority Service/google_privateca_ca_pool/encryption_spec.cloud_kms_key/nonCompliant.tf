resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  tier     = "ENTERPRISE"
}

resource "google_privateca_ca_pool" "non_compliant_example_2" {
  name     = "non_compliant_example_2"
  location = "us-central1"
  tier     = "ENTERPRISE"

  encryption_spec {
    cloud_kms_key = "projects/my-project/locations/us-central1/keyRings/my-kr"
  }
}