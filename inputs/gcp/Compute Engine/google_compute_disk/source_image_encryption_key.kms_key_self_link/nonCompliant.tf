resource "google_compute_disk" "non_compliant_example_1" {
  name  = "non-compliant-example-1"
  zone  = "australia-southeast1-a"
  type  = "pd-ssd"
  image = "projects/other-project/global/images/other-encrypted-image"

  source_image_encryption_key {
    kms_key_self_link = "projects/other-project/locations/us-central1/keyRings/other-ring/cryptoKeys/other-key"
  }
}