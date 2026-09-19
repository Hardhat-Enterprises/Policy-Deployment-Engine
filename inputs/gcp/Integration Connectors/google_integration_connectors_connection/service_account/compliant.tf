resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-svcacct"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"
  service_account   = "connector-sa@test-project.iam.gserviceaccount.com"
}
