resource "google_organization_access_approval_settings" "nc" {
  organization_id     = ""

  enrolled_services {
      cloud_product = "all"
  }
}