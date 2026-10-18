resource "google_data_loss_prevention_job_trigger" "non_compliant_example_1" {
  parent          = "projects/example-project/locations/australia-southeast1"
  status          = "HEALTHY"
  deletion_policy = "PREVENT"

  triggers {
    schedule {
      recurrence_period_duration = "86400s"
    }
  }

  inspect_job {
    storage_config {
      timespan_config {
        start_time = "2025-01-01T00:00:00Z"
      }

      cloud_storage_options {
        file_set {
          url = "gs://example-bucket/input/"
        }
      }
    }
  }
}