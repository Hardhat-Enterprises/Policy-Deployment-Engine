resource "google_compute_region_disk" "compliant_example_1" {
  name    = "compliant-source-image-raw-key-disk"
  project = "fake-project"
  region  = "us-central1"

  type = "pd-ssd"
  size = 200

  replica_zones = [
    "us-central1-a",
    "us-central1-f"
  ]

  source_image_encryption_key {
    kms_key_name = "projects/fake-project/locations/us-central1/keyRings/image-keyring/cryptoKeys/image-key"
  }
}