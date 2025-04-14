provider "google" {
  credentials = file("${path.module}/../../secrets/credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "secure-demo-instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_image
      size = 20
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  labels = {
    created_by = "terraform"
  }
}
