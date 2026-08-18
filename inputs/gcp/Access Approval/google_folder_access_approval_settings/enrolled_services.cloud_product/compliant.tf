resource "google_folder_access_approval_settings" "compliant_example_1" {
  folder_id = "c"

  enrolled_services {
    cloud_product = "all"
  }
}
