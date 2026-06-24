resource "google_organization_access_approval_settings" "non_compliant_example_1" {
  organization_id = "Hardhat"

  enrolled_services {
    cloud_product = "none"
  }
}
