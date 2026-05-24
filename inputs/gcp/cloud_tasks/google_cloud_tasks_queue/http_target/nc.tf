# Non-compliant http_target

resource "google_cloud_tasks_queue" "nc" {
  name     = "nc"
  location = "us-central1"

  http_target {
    http_method = "GET"   

    uri_override {
      scheme = "HTTP"     
      host   = "insecure.example.com"
    }
  }
}