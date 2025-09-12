
# Create Google Lustre instance
resource "google_lustre_instance" "c" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "c"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "network1"
  per_unit_storage_throughput = 1000
  gke_support_enabled = true
  labels = {
    test = "value"
  }
  timeouts {
    create = "120m"
  }
}
