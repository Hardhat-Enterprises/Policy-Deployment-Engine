resource "google_gkeonprem_bare_metal_admin_cluster" "c" {
  name               = "c"
  project            = "PDE"
  location           = "australia_southeast1"
  bare_metal_version = "1.13.4"
}