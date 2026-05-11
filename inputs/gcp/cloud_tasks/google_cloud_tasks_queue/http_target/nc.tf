# Non-compliant http_target

resource "google_cloud_tasks_queue" "nc" {
  name     = "insecure-http-queue"
  location = "us-central1"

  http_target {
    http_method = "GET"   # unsafe method

    uri_override {
      scheme = "HTTP"     # insecure protocol
      host   = "insecure.example.com"
    }
  }
}