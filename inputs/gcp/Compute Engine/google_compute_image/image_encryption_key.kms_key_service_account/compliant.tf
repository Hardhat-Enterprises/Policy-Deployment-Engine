resource "google_compute_image" "compliant_example_1" {
  name        = "compliant-example-1"
  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  image_encryption_key {
    kms_key_self_link       = "projects/pde-demo/locations/global/keyRings/example-keyring/cryptoKeys/example-key"
    kms_key_service_account = "image-kms@pde-demo.iam.gserviceaccount.com"
  }
}