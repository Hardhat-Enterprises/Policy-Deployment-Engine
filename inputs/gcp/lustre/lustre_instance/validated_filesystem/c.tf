# Create VPC network named "my-network1"
resource "google_compute_network" "lustre-network1" {
  name                    = "my-network1"
  auto_create_subnetworks = true
  project                 = "fake-project"
}

# Create Google Lustre instance
resource "google_lustre_instance" "c" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "australia-southeast1-a"
  description                 = "c"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = google_compute_network.lustre-network1.id
  per_unit_storage_throughput = 1000
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
