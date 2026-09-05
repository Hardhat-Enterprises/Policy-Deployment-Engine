resource "google_gkeonprem_bare_metal_admin_cluster" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  project  = "PDE"
  location = "australia-southeast1"

  cluster_operations {
    enable_application_logs = false
  }
}
