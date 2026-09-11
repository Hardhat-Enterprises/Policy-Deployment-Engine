resource "google_compute_image" "compliant_example_1" {
  name        = "compliant-example-1"
  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  source_disk_encryption_key {
    kms_key_self_link       = "projects/platform-security/locations/global/keyRings/compute-images/cryptoKeys/source-disk-cmek"
    kms_key_service_account = "source-disk-kms@platform-security.iam.gserviceaccount.com"
  }
}