resource "google_compute_region_instance_template" "non_compliant_example_1" {
  name         = "pde-kms-self-link-non-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"


  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
    auto_delete  = true
  }

  network_interface {
    network = "default"
  }
}
