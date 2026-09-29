resource "google_compute_region_instance_template" "non_compliant_example_1" {
  name         = "pde-source-image-raw-key-non-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_image = "projects/my-project/global/images/my-encrypted-image"
    boot         = true
    auto_delete  = true

    source_image_encryption_key {
      raw_key = "SGVsbG8gZnJvbSBIb29nbGUgQ2xvdWQgUGxhdGZvcm0="
    }
  }

  network_interface {
    network = "default"
  }
}
