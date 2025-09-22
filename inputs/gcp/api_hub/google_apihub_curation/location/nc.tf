resource "google_apihub_curation" "nc1" {
  location = "us-central1"
  curation_id = "test"
  project = "DEV"
  display_name = "API Hub Curation Location Compliant Test NC1"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_PDE_1"
      uri = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}

resource "google_apihub_curation" "nc2" {
  location = "us-central1"
  curation_id = "test"
  project = "abcd_misconfigured"
  display_name = "API Hub Curation Location Compliant Test NC2"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_PDE_1"
      uri = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}
