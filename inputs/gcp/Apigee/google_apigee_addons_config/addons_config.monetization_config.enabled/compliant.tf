resource "google_apigee_addons_config" "compliant_example_1" {
  org = "PDE-Project1"

  addons_config {
    monetization_config {
      enabled = true
    }
  }
}
