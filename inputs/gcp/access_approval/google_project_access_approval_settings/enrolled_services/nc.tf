resource "google_project_access_approval_settings" "nc" {
  project_id = "PDE"

  enrolled_services {
    cloud_product = "none"
  }
}
