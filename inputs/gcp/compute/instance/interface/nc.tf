# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_compute_instance" "nc" {
  name         = "diskinterface-nc"
  machine_type = "e2-micro"
  project      = "gcp-project-id"
  zone         = "australia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"
  }
}
