resource "google_compute_image" "non_compliant_example_1" {
  name         = "non-compliant-example-1"
  source_image = "projects/pde-demo/global/images/example-source-image"

  source_image_encryption_key {
    kms_key_self_link = "projects/pde-demo/locations/global/keyRings/pde-ring/cryptoKeys/source-image-key"
  }
}