# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_compute_instance" "c" {
  name         = "desired-status-c"
  machine_type = "e2-medium"
  project      = "gcp-project-id"
  zone         = "australia-southeast1-a"

  desired_status = "RUNNING"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

