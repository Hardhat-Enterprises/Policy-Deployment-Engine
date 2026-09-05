resource "google_app_engine_flexible_app_version" "compliant_example_1" {
  project    = "gcp-project-12345"
  version_id = "v1"
  service    = "compliant-example-1"
  runtime    = "nodejs"

  automatic_scaling {
    cpu_utilization {
      target_utilization = 0.5
    }
  }

  liveness_check { path = "/" }
  readiness_check { path = "/" }
}
