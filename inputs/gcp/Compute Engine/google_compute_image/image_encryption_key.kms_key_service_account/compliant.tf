resource "google_compute_image" "compliant_example_1" {
  name        = "compliant-example-1"
  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  image_encryption_key {
    kms_key_self_link       = "projects/platform-security/locations/global/keyRings/compute-images/cryptoKeys/image-cmek"
    kms_key_service_account = "image-kms@platform-security.iam.gserviceaccount.com"
  }
}