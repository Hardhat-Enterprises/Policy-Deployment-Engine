resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  tier     = "ENTERPRISE"

  encryption_spec {
    cloud_kms_key = "projects/my-project/locations/us-central1/keyRings/my-kr/cryptoKeys/my-key"
  }
}