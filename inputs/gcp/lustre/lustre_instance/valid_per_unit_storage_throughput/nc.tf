
# Create Google Lustre instance
resource "google_lustre_instance" "noncompliant_throughput" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "lustre throughput-nc"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "network2"
  per_unit_storage_throughput = 15000
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
