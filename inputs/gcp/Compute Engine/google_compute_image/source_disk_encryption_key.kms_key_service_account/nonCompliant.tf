resource "google_compute_image" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  source_disk_encryption_key {
    kms_key_self_link = "projects/pde-demo/locations/global/keyRings/pde-ring/cryptoKeys/source-disk-key"
  }
}