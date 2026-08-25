resource "google_compute_image" "compliant_example_1" {
  name         = "compliant-example-1"
  source_image = "projects/pde-demo/global/images/example-source-image"

  source_image_encryption_key {
    kms_key_self_link       = "projects/pde-demo/locations/global/keyRings/pde-ring/cryptoKeys/source-image-key"
    kms_key_service_account = "source-image-kms@pde-demo.iam.gserviceaccount.com"
  }
}