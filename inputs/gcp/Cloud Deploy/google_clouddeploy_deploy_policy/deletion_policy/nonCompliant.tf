resource "google_clouddeploy_deploy_policy" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  location        = "australia-southeast1"
  project         = "my-project-name"
  deletion_policy = "DELETE"

  selectors {
    delivery_pipeline {
      id = "cd-pipeline"
      labels = {
        foo = "bar"
      }
    }
  }

  suspended = false

  rules {
    rollout_restriction {
      id = "rule"

      time_windows {
        time_zone = "America/Los_Angeles"

        weekly_windows {
          start_time {
            hours   = "12"
            minutes = "00"
          }

          end_time {
            hours   = "13"
            minutes = "00"
          }
        }
      }
    }
  }
}
