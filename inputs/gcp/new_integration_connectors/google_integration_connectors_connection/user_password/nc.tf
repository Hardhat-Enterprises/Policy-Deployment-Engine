resource "google_integration_connectors_connection" "nc" {
  name              = "nc"
  location          = "us-central1"
  project           = "PDE_connectors"
  service_account   = "compute@developer.gserviceaccount.com"
  connector_version = "projects/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "USER_PASSWORD"
    user_password {
      username = "user@xyz.com"
      password {
        secret_version = "dummypassword"
      }
    }
  }
}


