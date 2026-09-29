resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-authtype"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "AUTH_TYPE_UNSPECIFIED"
    user_password {
      username = "u"
    }
  }
}
