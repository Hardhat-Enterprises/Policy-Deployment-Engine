resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-lockcfg"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  lock_config {
    locked = false
    reason = "in use"
  }
}
