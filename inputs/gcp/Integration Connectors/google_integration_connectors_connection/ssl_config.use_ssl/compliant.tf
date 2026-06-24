resource "google_integration_connectors_connection" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  project = "PDE_connectors"
  service_account = "compute@developer.gserviceaccount.com"
  connector_version = "projects/locations/global/providers/zendesk/connectors/zendesk/versions/1"
  

ssl_config {
    type             = "TLS"
    use_ssl          = true
  }
}
