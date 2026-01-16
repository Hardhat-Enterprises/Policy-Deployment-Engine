resource "google_gkeonprem_bare_metal_admin_cluster" "admin-cluster-basic-nc" {
  name = "my-cluster"
  project = "my-project"
  location = "europe-west1"
  bare_metal_version = "1.11.4"
}