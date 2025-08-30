resource "google_apihub_curation" "nc1" { 
  location = "us-central1"
  curation_id = "test"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC1"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1"
      uri = "http://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}

resource "google_apihub_curation" "nc2" { 
  location = "us-central1"
  curation_id = "test"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC2"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1"
      uri = "null"
    }
  }

}

resource "google_apihub_curation" "nc3" { 
  location = "us-central1"
  curation_id = "test"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC3"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "api_trigger/curation_API_1"
      uri = ""
    }
  }

}

resource "google_apihub_curation" "nc4" { 
  location = "us-central1"
  curation_id = "test"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC4"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = ""
      uri = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}

resource "google_apihub_curation" "nc5" { 
  location = "us-central1"
  curation_id = "test"
  project = "PDE"
  display_name = "API Hub Curation Endpoint Compliant Test NC5"
  endpoint {
    application_integration_endpoint_details {
      trigger_id = "RANDOM_9999"
      uri = "https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute"
    }
  }

}