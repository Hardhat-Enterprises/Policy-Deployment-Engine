resource "google_apihub_curation" "compliant_example_1" {
  location        = "australia-southeast1"
  curation_id     = "compliant_example_1"
  project         = "PDE"
  display_name    = "API Hub Curation Deletion Policy Compliant Test"
  deletion_policy = "PREVENT"

  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_PDE1"
      uri        = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/australia-southeast1/integrations/curation:execute"
    }
  }
}
