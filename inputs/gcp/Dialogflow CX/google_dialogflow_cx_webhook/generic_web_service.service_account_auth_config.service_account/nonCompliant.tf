resource "google_dialogflow_cx_webhook" "non_compliant_example_1" {
  parent       = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name = "non_compliant_example_1"

  generic_web_service {
    uri = "https://example.com/webhook"

    service_account_auth_config {
      service_account = "123456789012-compute@developer.gserviceaccount.com"
    }
  }
}

resource "google_dialogflow_cx_webhook" "non_compliant_example_2" {
  parent       = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name = "non_compliant_example_2"

  generic_web_service {
    uri = "https://example.com/webhook"

    service_account_auth_config {
      service_account = "example-project@appspot.gserviceaccount.com"
    }
  }
}
