resource "google_apigee_app_group" "compliant_example_1" {
  name = "active-app-group"
  org_id = "PDE-Apigee-Project"
  status = "active"
}