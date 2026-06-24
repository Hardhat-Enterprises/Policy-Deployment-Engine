resource "google_organization_access_approval_settings" "compliant_example_1" {
  organization_id = "Hardhat"

  enrolled_services {
    cloud_product = "all"
  }
}
