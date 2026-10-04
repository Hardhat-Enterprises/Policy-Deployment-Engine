resource "google_compute_instance_template" "non_compliant_example_1" {
  name                        = "non-compliant-template"
  machine_type                = "e2-medium"
  key_revocation_action_type  = "NONE"

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete   = true
    boot          = true
  }

  network_interface {
    network = "default"
  }
}