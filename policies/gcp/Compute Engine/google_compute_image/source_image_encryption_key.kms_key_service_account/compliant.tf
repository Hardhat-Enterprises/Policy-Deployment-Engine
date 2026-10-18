resource "google_compute_image" "compliant_example_1" {
  name         = "compliant-example-1"
  source_image = "projects/pde-demo/global/images/example-source-image"

  source_image_encryption_key {
    kms_key_self_link       = "projects/platform-security/locations/global/keyRings/compute-images/cryptoKeys/source-image-cmek"
    kms_key_service_account = "source-image-kms@platform-security.iam.gserviceaccount.com"
  }
}