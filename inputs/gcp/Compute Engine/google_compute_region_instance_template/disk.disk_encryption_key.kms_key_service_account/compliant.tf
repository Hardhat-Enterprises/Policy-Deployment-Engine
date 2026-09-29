resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-kms-sa-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
    auto_delete  = true

    disk_encryption_key {
      kms_key_self_link       = "projects/example-project/locations/global/keyRings/example-ring/cryptoKeys/example-key"
      kms_key_service_account = "example-sa@example-project.iam.gserviceaccount.com"
    }
  }

  network_interface {
    network = "default"
  }
}
