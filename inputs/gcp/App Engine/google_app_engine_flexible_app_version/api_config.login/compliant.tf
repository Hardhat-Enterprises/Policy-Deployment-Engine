resource "google_app_engine_flexible_app_version" "compliant_example_1" {
  version_id      = "v1"
  service         = "compliant_example_1"
  runtime    = "python"

  readiness_check {
    path = "/ready"
  }

  liveness_check {
    path = "/healthy"
  }

  api_config {
    script = "auto"
    login  = "LOGIN_REQUIRED"
  }

  automatic_scaling {
    cpu_utilization {
      target_utilization = 0.5
    }
  }
}
