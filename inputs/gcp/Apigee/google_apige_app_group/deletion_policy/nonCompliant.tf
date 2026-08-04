resource "google_apigee_app_group" "non_compliant_example_1" {
  name = "insecure-app-group"
  org_id = "PDE-Apigee-Project"
  deletion_policy = "DELETE"
}