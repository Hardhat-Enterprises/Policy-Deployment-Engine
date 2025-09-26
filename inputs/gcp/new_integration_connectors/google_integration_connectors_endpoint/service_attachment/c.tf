resource "google_integration_connectors_endpoint_attachment" "sampleendpointattachment" {
  name                = "test-endpoint-attachment"
  project             = "PDE endpoint"
  location            = "us-central1"
  service_attachment  = "projects/connectors-example/regions/us-central1/serviceAttachments/test"
}
