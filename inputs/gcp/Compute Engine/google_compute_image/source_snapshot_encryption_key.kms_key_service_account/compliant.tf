resource "google_compute_image" "compliant_example_1" {
  name            = "compliant-example-1"
  source_snapshot = "projects/pde-demo/global/snapshots/example-source-snapshot"

  source_snapshot_encryption_key {
    kms_key_self_link       = "projects/platform-security/locations/global/keyRings/compute-images/cryptoKeys/source-snapshot-cmek"
    kms_key_service_account = "source-snapshot-kms@platform-security.iam.gserviceaccount.com"
  }
}