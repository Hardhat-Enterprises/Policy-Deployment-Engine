resource "google_compute_instance_template" "non_compliant_example_1" {
  name         = "non-compliant-template"
  machine_type = "e2-medium"

  disk {
    source_image = "projects/fake-project/global/images/hardened-debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }
}
