resource "google_netapp_storage_pool" "non_compliant_example_1" {
  project       = "example-project"
  name          = "non_compliant_example_1"
  location      = "australia-southeast2"
  service_level = "PREMIUM"
  capacity_gib  = 2048
  network       = "projects/example-project/global/networks/example-vpc"

  kms_config = "invalid-kms-config"
}