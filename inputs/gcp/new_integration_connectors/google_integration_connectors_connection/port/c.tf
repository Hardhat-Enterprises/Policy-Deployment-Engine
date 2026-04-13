resource "google_integration_connectors_connection" "c" {
  name              = "c"
  location          = "us-central1"
  project           = "PDE_connectors"
  service_account   = "compute@developer.gserviceaccount.com"
  connector_version = "projects/locations/global/providers/zendesk/connectors/zendesk/versions/1"


  destination_config {
    key = "url"
    destination {
      host = "https://test.zendesk.com"
      port = 443
    }
  }
}