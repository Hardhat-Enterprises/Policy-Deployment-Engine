resource "google_lustre_instance" "compliant_example_1" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "compliant_example_1"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "projects/fake-project/global/networks/network1"
  per_unit_storage_throughput = 1000

  gke_support_enabled = true

  kms_key = "projects/fake-project/locations/us-central1/keyRings/test-key-ring/cryptoKeys/test-key"

  labels = {
    test = "value"
  }

  timeouts {
    create = "120m"
  }
}