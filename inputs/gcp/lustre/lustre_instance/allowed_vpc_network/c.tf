# Create VPC network named "my-network1"

# Create Google Lustre instance
resource "google_lustre_instance" "compliant_network" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "lustre network-c"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "projects/fs1/global/networks/nw1"
  per_unit_storage_throughput = 1000
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
