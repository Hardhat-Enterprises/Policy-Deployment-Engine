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
    access_config {
      nat_ip = "127.0.0.1" # Whitelisted IP
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
