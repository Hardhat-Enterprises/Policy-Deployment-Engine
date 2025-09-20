# Create VPC network named "my-network1"

# Create Google Lustre instance
resource "google_lustre_instance" "nc" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "australia-southeast1-a"
  description                 = "nc"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "projects/fs9/global/networks/nw6"
  per_unit_storage_throughput = 1000
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
