resource "google_gkeonprem_bare_metal_admin_cluster" "nc" {
  name               = "nc"
  project            = "PDE"
  location           = "europe-west1"
  bare_metal_version = "1.11.4"
}