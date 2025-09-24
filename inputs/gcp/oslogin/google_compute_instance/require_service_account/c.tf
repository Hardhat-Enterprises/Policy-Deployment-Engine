resource "google_compute_instance" "c" {
  project      = "dummy-project"
  name         = "good-instance"
  machine_type = "e2-micro"
  zone         = "australia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    enable-oslogin       = "TRUE"
    block-project-ssh-keys = "TRUE"
  }

  service_account {
    email  = "good-sa@dummy-project.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/logging.write"]
  }
}
