resource "google_apigee_addons_config" "nc" {
  org = "test_organization"

  addons_config {
    api_security_config {
      enabled = false
    }
  }
}