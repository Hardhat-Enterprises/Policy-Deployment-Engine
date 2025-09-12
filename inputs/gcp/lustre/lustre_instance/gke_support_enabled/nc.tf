
# Create Google Lustre instance
resource "google_lustre_instance" "nc" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "nc"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "network1"
  per_unit_storage_throughput = 1000
  gke_support_enabled = false
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
