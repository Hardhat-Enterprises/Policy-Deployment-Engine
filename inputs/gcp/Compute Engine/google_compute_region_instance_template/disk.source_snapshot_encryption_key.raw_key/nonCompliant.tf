resource "google_compute_region_instance_template" "non_compliant_example_1" {
  name         = "pde-source-snapshot-raw-key-non-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_snapshot = "projects/my-project/global/snapshots/my-snapshot"
    boot            = true
    auto_delete     = true

    source_snapshot_encryption_key {
      raw_key = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
    }
  }

  network_interface {
    network = "default"
  }
}
