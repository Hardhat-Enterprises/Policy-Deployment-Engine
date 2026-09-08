resource "google_compute_region_disk" "non_compliant_example_1" {
  name    = "non-compliant-source-image-service-account-disk"
  project = "fake-project"
  region  = "us-central1"

  type = "pd-ssd"
  size = 200

  replica_zones = [
    "us-central1-a",
    "us-central1-f"
  ]

  source_image_encryption_key {
    kms_key_name            = "projects/fake-project/locations/us-central1/keyRings/image-keyring/cryptoKeys/image-key"
    kms_key_service_account = ""
  }
}