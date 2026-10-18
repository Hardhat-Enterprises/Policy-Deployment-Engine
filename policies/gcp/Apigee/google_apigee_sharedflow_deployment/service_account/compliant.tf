resource "google_apigee_sharedflow_deployment" "compliant_example_1" {
  environment     = "Production"
  org_id          = "PDE-Apigee-Project"
  revision        = "1"
  sharedflow_id   = "example-sharedflow"
  service_account = "apigee-sa@example-project.iam.gserviceaccount.com"
}
