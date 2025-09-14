resource "google_organization_access_approval_settings" "c" {
  organization_id = "Hardhat"

  enrolled_services {
    cloud_product = "all"
  }
}
