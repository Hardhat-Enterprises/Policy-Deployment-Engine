resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-authkms"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "USER_PASSWORD"
    additional_variable {
      key = "k1"
      encryption_key_value {
        type         = "CUSTOMER_MANAGED"
        kms_key_name = "projects/test-project/locations/australia-southeast1/keyRings/kr1/cryptoKeys/k1"
      }
    }
    user_password {
      username = "u"
    }
  }
}
