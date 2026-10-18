resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name                     = "noncompliant-evtpw"
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
      auth_key  = "sampleAuthKey"
      user_password {
        username = "u"
        password {
          secret_version = "projects/test-project/secrets/s1/versions/latest"
        }
      }
    }
  }
}
