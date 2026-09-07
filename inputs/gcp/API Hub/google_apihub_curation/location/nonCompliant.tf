resource "google_apihub_curation" "non_compliant_example_1" {
  location     = "us-central1"
  curation_id  = "non_compliant_example_1"
  project      = "PDE"
  display_name = "API Hub Curation Location Compliant Test"

  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_PDE1"
      uri        = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/australia-southeast1/integrations/curation:execute"
    }
  }
}
