# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_compute_instance" "c" {
  name         = "machinetype-c"
  machine_type = "e2-standard-2"
  project      = "gcp-project-id"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
