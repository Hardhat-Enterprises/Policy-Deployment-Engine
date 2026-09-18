resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name         = "compliant-endpoint"
  display_name = "sample-endpoint"
  location     = "us-central1"
  network      = "projects/my-project/global/networks/custom-vpc"
}