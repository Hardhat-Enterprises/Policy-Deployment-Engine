resource "google_compute_instance_template" "compliant_example_1" {
  name         = "compliant-example-1"
  machine_type = "e2-medium"
  region       = "australia-southeast1"

  disk {
    source_image = "debian-cloud/debian-12"
  }

  network_interface {
    network = "default"
  }
}