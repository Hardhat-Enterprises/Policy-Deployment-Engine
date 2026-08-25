resource "google_compute_disk" "compliant_example_1" {
  name  = "compliant-example-1"
  zone  = "australia-southeast1-a"
  type  = "pd-ssd"
  image = "projects/my-project/global/images/my-encrypted-image"

  source_image_encryption_key {
    kms_key_self_link       = "projects/my-project/locations/australia-southeast1/keyRings/my-key-ring/cryptoKeys/my-key"
    kms_key_service_account = "disk-encrypter@my-project.iam.gserviceaccount.com"
  }
}