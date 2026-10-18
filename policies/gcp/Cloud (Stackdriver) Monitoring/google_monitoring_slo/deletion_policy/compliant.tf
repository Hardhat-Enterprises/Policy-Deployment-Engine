resource "google_monitoring_slo" "compliant_example_1" {
  service      = "projects/PDE/services/example-service"
  slo_id       = "compliant_example_1"
  display_name = "Example Monitoring SLO"
  goal         = 0.95

  rolling_period_days = 28
  deletion_policy     = "PREVENT"

  basic_sli {
    availability {
      enabled = true
    }
  }
}
