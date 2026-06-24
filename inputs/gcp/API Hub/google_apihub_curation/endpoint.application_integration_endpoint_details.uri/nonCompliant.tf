resource "google_apihub_curation" "non_compliant_example_1" { 
  location = "us-central1"
  curation_id = "non_compliant_example_1"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC1"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1"
      uri = "http://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}

resource "google_apihub_curation" "non_compliant_example_2" { 
  location = "us-central1nc2"
  curation_id = "non_compliant_example_2"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC2"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1"
      uri = "null"
    }
  }

}

resource "google_apihub_curation" "non_compliant_example_3" { 
  location = "us-central1nc3"
  curation_id = "non_compliant_example_3"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC3"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1"
      uri = ""
    }
  }

}
