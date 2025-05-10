resource "google_compute_instance" "c" {
  name         = "bootdiskimage-c"
  machine_type = "n1-standard-1"
  project      = "gcp-project-id" 
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = 20
    }
  }
  

  network_interface {
    network = "default"
  }
}