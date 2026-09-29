resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-source-snapshot-kms-sa-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_snapshot = "projects/my-project/global/snapshots/my-snapshot"
    boot            = true
    auto_delete     = true

    source_snapshot_encryption_key {
      kms_key_service_account = "example-sa@example-project.iam.gserviceaccount.com"
    }
  }

  network_interface {
    network = "default"
  }
}
