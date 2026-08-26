resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "us-central1"
  network      = "projects/123456789/global/networks/my-secure-vpc"
}