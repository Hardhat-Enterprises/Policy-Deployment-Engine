# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_compute_instance" "c" {
  name         = "deletionprotection-c"
  machine_type = "n1-standard-1"
  project      = "gcp-project-id"
  zone         = "us-central1-a"

  deletion_protection = true

 
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
