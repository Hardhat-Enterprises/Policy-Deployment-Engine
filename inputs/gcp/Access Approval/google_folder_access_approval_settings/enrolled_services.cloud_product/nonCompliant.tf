resource "google_folder_access_approval_settings" "non_compliant_example_1" {
  folder_id = "c"

  enrolled_services {
    cloud_product = "none"
  }
}
