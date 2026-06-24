resource "google_netapp_storage_pool" "nc1" {
  project       = "deakin-lab-123"
  name          = "nc1"
  location      = "us-central1"                          # non-AU (NC)
  service_level = "PREMIUM"
  capacity_gib  = 2048
  network       = "projects/deakin-lab-123/global/networks/nondefault-vpc"         # default VPC (NC)
}
