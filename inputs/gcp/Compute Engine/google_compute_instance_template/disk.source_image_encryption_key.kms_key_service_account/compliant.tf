resource "google_compute_instance_template" "compliant_example_1" {
  name         = "compliant-template"
  machine_type = "e2-medium"

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete   = true
    boot          = true
    source_image_encryption_key {
      kms_key_self_link       = "projects/fake-project/locations/us-central1/keyRings/fake-ring/cryptoKeys/fake-key"
      kms_key_service_account = "fake-sa@fake-project.iam.gserviceaccount.com"
    }
  }

  network_interface {
    network = "default"
  }

  service_account {
    email  = "fake-sa@fake-project.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}