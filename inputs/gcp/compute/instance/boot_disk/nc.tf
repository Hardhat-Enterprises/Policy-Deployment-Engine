resource "google_compute_instance" "nc" {
  name         = "bootdiskimage-nc"
  machine_type = "n1-standard-1"
  project      = "gcp-project-id" 
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-server-2022"
      size = 40
    }
  }

  network_interface {
    network = "default"
  }
}
