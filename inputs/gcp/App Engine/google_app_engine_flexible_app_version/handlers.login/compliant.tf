resource "google_app_engine_flexible_app_version" "compliant_example_1" {
  version_id = "compliant-example-1"
  service    = "compliant-example-1"
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

  handlers {
    url_regex = ".*"
    login     = "LOGIN_REQUIRED"
  }
}
