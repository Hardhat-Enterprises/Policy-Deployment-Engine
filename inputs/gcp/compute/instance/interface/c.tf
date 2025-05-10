# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_compute_instance" "c" {
  name         = "diskinterface-c"
  machine_type = "e2-micro"
  project      = "gcp-project-id"
  zone         = "australia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"
  }
}
