# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_compute_instance" "nc" {
  name         = "deletionprotection-nc"
  machine_type = "n1-standard-1"
  project      = "gcp-project-id"
  zone         = "us-central1-a"

  deletion_protection = false

 
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
