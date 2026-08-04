resource "google_apigee_app_group" "compliant_example_1" {
  name = "secure-app-group"
  org_id = "PDE-Apigee-Project"
  deletion_policy = "PREVENT"
}