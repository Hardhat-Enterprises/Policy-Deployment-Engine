resource "google_compute_image" "compliant_example_1" {
  name            = "compliant-example-1"
  source_snapshot = "projects/pde-demo/global/snapshots/example-source-snapshot"

  source_snapshot_encryption_key {
    kms_key_self_link       = "projects/pde-demo/locations/global/keyRings/pde-ring/cryptoKeys/source-snapshot-key"
    kms_key_service_account = "source-snapshot-kms@pde-demo.iam.gserviceaccount.com"
  }
}