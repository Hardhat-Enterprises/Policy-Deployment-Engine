resource "google_netapp_storage_pool" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "non_compliant_example_1"
  location      = "australia-southeast2"                          # non-AU (NC)
  service_level = "PREMIUM"
  capacity_gib  = 2048
  network       = "projects/deakin-lab-123/global/networks/default"         # default VPC (NC)
}
