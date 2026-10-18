resource "google_netapp_storage_pool" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "non_compliant_example_1"
  location      = "australia-southeast2"
  service_level = "FLEX"
  capacity_gib  = 2048
  network       = "projects/deakin-lab-123/global/networks/nondefault-vpc"

  zone         = "australia-southeast2-a"
  replica_zone = "us-central1-b"
}