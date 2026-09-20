resource "google_integration_connectors_connection" "compliant_example_1" {
  name                     = "compliant-evport"
  location                 = "australia-southeast1"
  connector_version        = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"
  eventing_enablement_type = "EVENTING_AND_CONNECTION"

  eventing_config {
    registration_destination_config {
      key = "registration_destination_config"
      destination {
        host = "https://test.zendesk.com"
        port = 443
      }
    }
    auth_config {
      auth_type = "USER_PASSWORD"
      user_password {
        username = "u"
      }
    }
  }
}
