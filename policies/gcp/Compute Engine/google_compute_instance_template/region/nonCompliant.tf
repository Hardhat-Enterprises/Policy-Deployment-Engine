resource "google_compute_instance_template" "non_compliant_example_1" {
  name         = "non-compliant-example-1"
  machine_type = "e2-medium"
  region       = "us-central1"

  disk {
    source_image = "debian-cloud/debian-12"
  }

  network_interface {
    network = "default"
  }
}