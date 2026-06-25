resource "google_project_access_approval_settings" "compliant_example_1" {
  project_id = "PDE"

  enrolled_services {
    cloud_product = "all"
  }
}
