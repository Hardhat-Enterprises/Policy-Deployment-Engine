resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-confidential-compute-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  confidential_instance_config {
    enable_confidential_compute = true
  }

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
    auto_delete  = true
  }

  network_interface {
    network = "default"
  }
}
