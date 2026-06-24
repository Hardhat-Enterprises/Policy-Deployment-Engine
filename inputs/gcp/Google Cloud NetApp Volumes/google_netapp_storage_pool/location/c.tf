resource "google_netapp_storage_pool" "c1" {
  project       = "deakin-lab-123"
  name          = "c1"
  location      = "australia-southeast2"                 # AU (OK)
  service_level = "PREMIUM"
  capacity_gib  = 2048
  network       = "projects/deakin-lab-123/global/networks/nondefault-vpc"  # non-default VPC
}
