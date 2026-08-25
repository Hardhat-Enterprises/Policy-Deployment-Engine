resource "google_compute_image" "compliant_example_1" {
  name        = "compliant-example-1"
  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  source_disk_encryption_key {
    kms_key_self_link = "projects/pde-demo/locations/global/keyRings/pde-ring/cryptoKeys/source-disk-key"
  }
}