# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_compute_instance" "c" {
  name         = "zone-c"
  machine_type = "n2-standard-2"
  project      = "grounded-chain-453821-k8"
  zone         = "australia-southeast1-a"

deletion_protection =  false
desired_status = "RUNNING"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = 20
    }
  }

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"
  }
}
