# Create VPC network named "my-network1"
resource "google_compute_network" "lustre-network2" {
  name                    = "my-network2"
  auto_create_subnetworks = true
  project                 = "fake-project"
}

# Create Google Lustre instance
resource "google_lustre_instance" "nc" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "australia-southeast1-a"
  description                 = "nc"
  filesystem                  = "tmy_hs_k"
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
