resource "google_apigee_addons_config" "compliant_example_1" {
  org             = "PDE-Apigee-Project"
  deletion_policy = "PREVENT"

  addons_config {
    advanced_api_ops_config {
      enabled = true
    }
    api_security_config {
      enabled = true
    }
  }
}
