# Create VPC network named "my-network1"
resource "google_compute_network" "lustre-network2" {
  name                    = "my-network2"
  auto_create_subnetworks = true
  project                 = "fake-project"
}

# Create Google Lustre instance
resource "google_lustre_instance" "noncompliant_gib" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "lustre instance-nc"
  filesystem                  = "testfs"
  capacity_gib                = 7454654
  network                     = google_compute_network.lustre-network2.id
  per_unit_storage_throughput = 1000
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
