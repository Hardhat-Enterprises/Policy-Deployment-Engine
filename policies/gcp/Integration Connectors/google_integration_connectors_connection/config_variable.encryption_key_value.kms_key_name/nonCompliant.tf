resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-cvkms"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  config_variable {
    key = "k1"
    encryption_key_value {
      type         = "GOOGLE_MANAGED"
      kms_key_name = ""
    }
  }
}
