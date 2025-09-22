resource "google_apihub_curation" "c1" {
  location = "us-central1"
  curation_id = "c1"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test C1"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_PDE_1"
      uri = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}

resource "google_apihub_curation" "c2" {
  location = "us-central1"
  curation_id = "c2"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test C2"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_PDE_3"
      uri = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}

