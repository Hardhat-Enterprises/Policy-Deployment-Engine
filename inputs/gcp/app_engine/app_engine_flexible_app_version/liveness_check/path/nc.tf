resource "google_app_engine_flexible_app_version" "nc" {
  version_id = "v1"
  project    = "gcp-project-12345"
  service    = "unauthorized-service"
  runtime    = "python27"

  entrypoint {
    shell = "python app.py"
  }

  deployment {
    zip {
      source_url = "storage.googleapis.com"
    }
  }

  manual_scaling {
    instances = 1
  }

  liveness_check {
    path = "/unapproved-endpoint"
  }

  readiness_check {
    path = "/not-monitored"
  }

  service_account = "google_service_account.custom_service_account.email"
}