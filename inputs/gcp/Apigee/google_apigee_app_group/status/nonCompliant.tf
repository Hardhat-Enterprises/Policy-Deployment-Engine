resource "google_apigee_app_group" "non_compliant_example_1" {
  name = "inactive-app-group"
  org_id = "PDE-Apigee-Project"
  status = "inactive"
}