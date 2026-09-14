resource "google_compute_disk" "compliant_example_1" {
  name  = "compliant-example-1"
  zone  = "australia-southeast1-a"
  image = "projects/debian-cloud/global/images/debian-11-bullseye-v20240110"

  source_image_encryption_key {
    kms_key_self_link = "projects/example-project/locations/global/keyRings/example-ring/cryptoKeys/example-key"
  }
}