resource "google_vertex_ai_index_endpoint_deployed_index" "non_compliant_example_1" {
  deployed_index_id = "non_compliant_example_1"
  region            = "australia-southeast1"
  index             = "projects/example-project/locations/australia-southeast1/indexes/example-index"
  index_endpoint    = "projects/example-project/locations/australia-southeast1/indexEndpoints/example-endpoint"
}