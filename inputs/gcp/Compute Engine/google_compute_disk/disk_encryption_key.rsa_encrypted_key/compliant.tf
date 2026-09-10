resource "google_compute_disk" "compliant_example_1" {
  name = "compliant-example-1"
  zone = "australia-southeast1-a"
  type = "pd-ssd"

  disk_encryption_key {
    kms_key_self_link = "projects/my-project/locations/australia-southeast1/keyRings/my-key-ring/cryptoKeys/my-key"
  }
}