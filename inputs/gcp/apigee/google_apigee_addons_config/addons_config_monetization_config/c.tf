resource "google_apigee_addons_config" "c" {
  org = "PDE-Project1"

  addons_config {
    monetization_config {
      enabled = true
    }
  }
}