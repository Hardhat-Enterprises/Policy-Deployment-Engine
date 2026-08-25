resource "google_compute_disk" "non_compliant_example_1" {
  name  = "non-compliant-example-1"
  zone  = "australia-southeast1-a"
  type  = "pd-ssd"
  image = "projects/my-project/global/images/my-encrypted-image"

  source_image_encryption_key {
    kms_key_self_link       = "projects/my-project/locations/australia-southeast1/keyRings/my-key-ring/cryptoKeys/my-key"
    kms_key_service_account = "service-123456@compute-system.iam.gserviceaccount.com"
  }
}