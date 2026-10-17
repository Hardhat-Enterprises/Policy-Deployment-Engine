resource "google_apigee_addons_config" "compliant_example_1" {
  org = "PDE-Apigee-Project"

  addons_config {
    api_security_config {
      enabled = true
    }
  }
}
