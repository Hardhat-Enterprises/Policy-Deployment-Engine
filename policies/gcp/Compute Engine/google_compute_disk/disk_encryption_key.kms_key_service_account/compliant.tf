resource "google_compute_disk" "compliant_example_1" {
  name = "compliant-example-1"
  zone = "australia-southeast1-a"

  disk_encryption_key {
    kms_key_service_account = "example-sa@example-project.iam.gserviceaccount.com"
  }
}