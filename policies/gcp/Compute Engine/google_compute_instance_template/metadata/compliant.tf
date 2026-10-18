resource "google_compute_instance_template" "compliant_example_1" {
  name         = "compliant-example-1"
  machine_type = "e2-medium"

  metadata = {
    enable-oslogin         = "TRUE"
    block-project-ssh-keys = "TRUE"
    serial-port-enable     = "FALSE"
  }

  disk {
    source_image = "debian-cloud/debian-12"
  }

  network_interface {
    network = "default"
  }
}
