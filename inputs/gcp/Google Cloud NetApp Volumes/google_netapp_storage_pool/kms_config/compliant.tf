resource "google_netapp_storage_pool" "compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "compliant-example-1"
  location      = "australia-southeast2"
  service_level = "PREMIUM"
  capacity_gib  = 2048
  network       = "projects/deakin-lab-123/global/networks/nondefault-vpc"

  kms_config = "projects/deakin-lab-123/locations/australia-southeast2/kmsConfigs/example-kms-config"
}