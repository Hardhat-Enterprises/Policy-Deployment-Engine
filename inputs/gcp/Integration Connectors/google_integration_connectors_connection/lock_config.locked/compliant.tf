resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-lockcfg"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  lock_config {
    locked = true
    reason = "in use"
  }
}
