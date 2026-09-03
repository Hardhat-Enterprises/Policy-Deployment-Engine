resource "google_gkeonprem_bare_metal_admin_cluster" "compliant_example_1" {
  name     = "compliant_example_1"
  project  = "PDE"
  location = "australia_southeast1"

  cluster_operations {
    enable_application_logs = true
  }
}
