resource "google_lustre_instance" "c" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "australia-southeast1-a"
  description                 = "c"
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
