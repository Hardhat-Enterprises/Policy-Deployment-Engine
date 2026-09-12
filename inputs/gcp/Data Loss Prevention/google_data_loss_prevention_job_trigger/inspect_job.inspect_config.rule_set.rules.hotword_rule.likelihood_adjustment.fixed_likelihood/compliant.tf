resource "google_data_loss_prevention_job_trigger" "compliant_example_1" {
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
      rule_set {
        info_types {
          name = "EMAIL_ADDRESS"
        }

        rules {
          hotword_rule {
            hotword_regex {
              pattern = "EMPLOYEE"
            }

            proximity {
              window_before = 50
            }

            likelihood_adjustment {
              fixed_likelihood = "LIKELY"
            }
          }
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
