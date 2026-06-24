resource "google_apigee_addons_config" "c" {
  org = "PDE-Project1"

  addons_config {
    advanced_api_ops_config {
      enabled = true
    }
  }
}