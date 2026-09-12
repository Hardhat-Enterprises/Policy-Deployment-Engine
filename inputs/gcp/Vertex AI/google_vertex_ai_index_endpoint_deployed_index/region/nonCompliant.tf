resource "google_vertex_ai_index_endpoint_deployed_index" "non_compliant_example_1" {
  deployed_index_id = "non_compliant_example_1"
  region            = "us-central1"
  index             = "projects/example-project/locations/us-central1/indexes/example-index"
  index_endpoint    = "projects/example-project/locations/us-central1/indexEndpoints/example-endpoint"
}