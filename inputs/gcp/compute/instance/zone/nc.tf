# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_compute_instance" "nc" {
  name         = "zone-nc"
  machine_type = "e2-medium"
  project      = "gcp-project-id"
  zone         = "asia-east1-c"  

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
