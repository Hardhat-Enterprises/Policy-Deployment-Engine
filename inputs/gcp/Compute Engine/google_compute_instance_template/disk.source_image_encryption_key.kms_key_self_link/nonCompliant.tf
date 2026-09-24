resource "google_compute_instance_template" "non_compliant_example_1" {
  name         = "non-compliant-template"
  machine_type = "e2-medium"

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete   = true
    boot          = true
    source_image_encryption_key {
      kms_key_self_link = "fake-image-key"
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