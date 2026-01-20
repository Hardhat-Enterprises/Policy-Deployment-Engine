resource "google_gkeonprem_bare_metal_admin_cluster" "c" {
  name = "my-cluster"
  project = "my-project"
  location = "australia"
  bare_metal_version = "1.13.4"
}