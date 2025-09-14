resource "google_project_access_approval_settings" "c" {
  project_id = "PDE"

  enrolled_services {
    cloud_product = "all"
  }
}
