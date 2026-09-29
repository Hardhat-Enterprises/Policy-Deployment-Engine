resource "google_compute_region_instance_template" "compliant_example_1" {
  name         = "pde-service-account-scopes-compliant"
  region       = "australia-southeast1"
  machine_type = "e2-micro"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
    auto_delete  = true
  }

  network_interface {
    network = "default"
  }

  service_account {
    email  = "my-service-account@example.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}
