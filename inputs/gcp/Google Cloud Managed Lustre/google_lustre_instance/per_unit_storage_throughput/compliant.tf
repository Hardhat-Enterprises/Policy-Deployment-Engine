# Create Google Lustre instance
resource "google_lustre_instance" "compliant_example_1" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "australia-southeast1-a"
  description                 = "compliant_example_1"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "network1"
  per_unit_storage_throughput = 1000
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
