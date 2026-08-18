# Non-compliant http_target

resource "google_cloud_tasks_queue" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  http_target {
    http_method = "GET"   

    uri_override {
      scheme = "HTTP"     
      host   = "insecure.example.com"
    }
  }
}
