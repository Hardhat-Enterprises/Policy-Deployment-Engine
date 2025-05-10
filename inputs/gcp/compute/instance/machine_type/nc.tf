# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_compute_instance" "nc" {
  name         = "machinetype-nc"
  machine_type = "custom-2-15360-ext"
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