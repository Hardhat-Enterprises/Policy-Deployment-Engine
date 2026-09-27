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
          exclusion_rule {
            matching_type = "MATCHING_TYPE_FULL_MATCH"

            exclude_info_types {
              info_types {
                name = "IP_ADDRESS"
              }
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
