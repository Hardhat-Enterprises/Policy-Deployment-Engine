resource "google_compute_instance_template" "compliant_example_1" {
  name         = "compliant-template"
  machine_type = "e2-medium"

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-2204-lts"
    auto_delete   = true
    boot          = true
  }

  network_interface {
    network = "default"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
  }
}