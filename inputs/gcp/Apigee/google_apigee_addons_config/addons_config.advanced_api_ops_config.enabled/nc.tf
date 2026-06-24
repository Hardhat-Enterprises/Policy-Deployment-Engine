resource "google_apigee_addons_config" "nc" {
  org = "PDE-Project1"

  addons_config {
    advanced_api_ops_config {
      enabled = false
    }
  }
}