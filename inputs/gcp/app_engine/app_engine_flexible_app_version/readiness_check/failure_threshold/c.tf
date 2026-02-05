resource "google_app_engine_flexible_app_version" "c" {
  version_id = "v1"
  project    = "gcp-project-12345"
  service    = "default"
  runtime    = "nodejs"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "storage.googleapis.com"
    }
  }

  automatic_scaling {
    cpu_utilization {
      target_utilization = 0.5
    }
  }

  liveness_check {
    path              = "/"
  }

  readiness_check {
    path = "/"
    failure_threshold = 4
  }

  service_account = "google_service_account.custom_service_account.email"
}