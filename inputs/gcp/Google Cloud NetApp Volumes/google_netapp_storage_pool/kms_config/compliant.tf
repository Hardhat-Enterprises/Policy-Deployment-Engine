resource "google_netapp_storage_pool" "compliant_example_1" {
  project       = "example-project"
  name          = "compliant_example_1"
  location      = "australia-southeast2"
  service_level = "PREMIUM"
  capacity_gib  = 2048
  network       = "projects/example-project/global/networks/example-vpc"

  kms_config = "projects/example-project/locations/australia-southeast2/kmsConfigs/example-config"
}