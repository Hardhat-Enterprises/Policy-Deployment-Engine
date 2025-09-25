resource "google_compute_instance" "nc" {
  project      = "dummy-project"
  name         = "bad-instance"
  machine_type = "e2-micro"
  zone         = "australia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {} # public IP added
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
