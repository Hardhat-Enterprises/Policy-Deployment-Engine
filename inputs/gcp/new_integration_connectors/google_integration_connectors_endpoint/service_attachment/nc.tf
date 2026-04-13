resource "google_integration_connectors_endpoint_attachment" "sampleendpointattachment-non_compliant" {
  name               = "test-endpoint-attachment"
  project            = "PDE endpoint"
  location           = "us-central1"
  service_attachment = "fake_project"
}