resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-threads-per-core-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  advanced_machine_features {
    threads_per_core = 1
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
