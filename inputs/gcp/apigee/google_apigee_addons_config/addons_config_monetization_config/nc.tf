resource "google_apigee_addons_config" "nc" {
  org = "PDE-Project1"

  addons_config {
    monetization_config {
      enabled = false
    }
  }
}