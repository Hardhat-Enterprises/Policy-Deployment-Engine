resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-cvkms"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  config_variable {
    key = "k1"
    encryption_key_value {
      type         = "CUSTOMER_MANAGED"
      kms_key_name = "projects/test-project/locations/australia-southeast1/keyRings/kr1/cryptoKeys/k1"
    }
  }
}
