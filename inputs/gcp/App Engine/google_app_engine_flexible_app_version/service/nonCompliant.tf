resource "google_app_engine_flexible_app_version" "non_compliant_example_1" {
  version_id = "v1"
  project    = "gcp-project-12345"
  service    = "unauthorized-app"
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
    path = "/"
  }

  readiness_check {
    path = "/"
  }

  service_account = "google_service_account.custom_service_account.email"
}
