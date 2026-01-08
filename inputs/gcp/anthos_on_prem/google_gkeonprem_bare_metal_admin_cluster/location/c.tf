resource "google_gkeonprem_bare_metal_admin_cluster" "admin-cluster-basic" {
  name = "my-cluster"
  project = "my-project"
  location = "us-west1"
  bare_metal_version = "1.13.4"
}