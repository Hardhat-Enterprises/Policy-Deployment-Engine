resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name         = "compliant-endpoint-1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  network      = "projects/my-project/global/networks/my-vpc"
}

resource "google_vertex_ai_endpoint" "compliant_example_2" {
  name         = "compliant-endpoint-2"
  display_name = "sample-endpoint"
  location     = "us-central1"
  
}