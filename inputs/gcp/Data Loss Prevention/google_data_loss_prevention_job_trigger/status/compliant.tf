resource "google_data_loss_prevention_job_trigger" "compliant_example_1" {
  parent = "projects/example-project/locations/australia-southeast1"
  status = "HEALTHY"

  triggers {
    schedule {
      recurrence_period_duration = "86400s"
    }
  }
}