resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-source-snapshot-rsa-key-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_snapshot = "projects/my-project/global/snapshots/my-snapshot"
    boot            = true
    auto_delete     = true
  }

  network_interface {
    network = "default"
  }
}
