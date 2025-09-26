resource "google_apihub_curation" "nc1" { 
  location = "us-central1"
  curation_id = "nc1"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC1"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1/aaaa"
      uri = "http://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}