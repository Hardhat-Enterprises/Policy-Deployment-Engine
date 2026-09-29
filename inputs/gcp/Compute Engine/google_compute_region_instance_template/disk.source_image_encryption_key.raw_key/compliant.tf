resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-source-image-raw-key-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_image = "projects/my-project/global/images/my-encrypted-image"
    boot         = true
    auto_delete  = true
  }

  network_interface {
    network = "default"
  }
}
