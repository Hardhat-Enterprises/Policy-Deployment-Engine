resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-authtype"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "USER_PASSWORD"
    user_password {
      username = "u"
    }
  }
}
