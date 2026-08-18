# Compliant http_target

resource "google_cloud_tasks_queue" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  http_target {
    http_method = "POST"

    uri_override {
      scheme = "HTTPS"
      host   = "secure.example.com"
    }

    oidc_token {
      service_account_email = "test@project.iam.gserviceaccount.com"
      audience              = "https://secure.example.com"
    }
  }
}
