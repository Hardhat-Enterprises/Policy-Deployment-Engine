resource "google_lustre_instance" "non_compliant_example_1" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "europe"
  description                 = "non_compliant_example_1"
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
