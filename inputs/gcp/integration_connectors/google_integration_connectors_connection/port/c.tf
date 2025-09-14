resource "google_secret_manager_secret" "secret-basic" {
  secret_id = "test-secret"
  project = "PDE_connectors"
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret = google_secret_manager_secret.secret-basic.id
  secret_data = "dummypassword"
}
resource "google_integration_connectors_connection" "zendeskconnection" {
  name     = "test-zendesk"
  location = "us-central1"
  project = "PDE_connectors"
  service_account = "compute@developer.gserviceaccount.com"
  connector_version = "projects/locations/global/providers/zendesk/connectors/zendesk/versions/1"
  

destination_config {
    key = "url"
    destination {
        host = "https://test.zendesk.com"
        port = 443
    }
}
}