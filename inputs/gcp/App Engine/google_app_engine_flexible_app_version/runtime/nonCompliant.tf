resource "google_app_engine_flexible_app_version" "non_compliant_example_1" {
  project    = "gcp-project-12345"
  version_id = "v1"
  service    = "non-compliant-example-1"
  runtime    = "python27"

  automatic_scaling {
    cpu_utilization {
      target_utilization = 0.5
    }
  }

  liveness_check { path = "/" }
  readiness_check { path = "/" }
}
