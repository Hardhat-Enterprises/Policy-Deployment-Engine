resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-authkms"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "USER_PASSWORD"
    additional_variable {
      key = "k1"
      encryption_key_value {
        type         = "GOOGLE_MANAGED"
        kms_key_name = ""
      }
    }
    user_password {
      username = "u"
    }
  }
}
