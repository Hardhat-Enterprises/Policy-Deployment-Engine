resource "google_app_engine_flexible_app_version" "non_compliant_example_1" {
  version_id = "non-compliant-example-1"
  service    = "non-compliant-example-1"
  runtime    = "python"

  readiness_check {
    path = "/ready"
  }

  liveness_check {
    path = "/healthy"
  }

  automatic_scaling {
    cpu_utilization {
      target_utilization = 0.5
    }
  }

  deployment {
    files {
      name       = "app.py"
      source_url = "http://storage.googleapis.com/example-bucket/app.py"
    }
  }
}
