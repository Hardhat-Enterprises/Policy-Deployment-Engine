resource "google_project_access_approval_settings" "non_compliant_example_1" {
  project_id = "PDE"

  enrolled_services {
    cloud_product = "none"
  }
}
