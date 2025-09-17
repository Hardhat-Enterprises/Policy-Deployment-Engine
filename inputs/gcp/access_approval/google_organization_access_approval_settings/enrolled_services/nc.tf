resource "google_organization_access_approval_settings" "nc" {
  organization_id = "Hardhat"

  enrolled_services {
    cloud_product = "none"
  }
}
