resource "google_apigee_addons_config" "non_compliant_example_1" {
  org = "PDE-Apigee-Project"

  addons_config {
    advanced_api_ops_config {
      enabled = false
    }
  }
}
