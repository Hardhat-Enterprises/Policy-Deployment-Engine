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
    inspect_config {
      custom_info_types {
        info_type {
          name = "CUSTOM_EMPLOYEE_ID"
        }

        likelihood     = "VERY_LIKELY"
        exclusion_type = "EXCLUSION_TYPE_EXCLUDE"

        regex {
          pattern = "EMP[0-9]{6}"
        }
      }
    }

    storage_config {
      cloud_storage_options {
        file_set {
          url = "gs://example-bucket/input/"
        }
      }
    }
  }
}
