# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_deploy_policy" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "my-project-name"
  selectors {
    delivery_pipeline {
      id = "cd-pipeline"
      labels = {
          foo = "bar"
      }
    }
   }
  suspended = true
  rules {
    rollout_restriction {
      id = "rule"
      time_windows {
        time_zone = "America/Los_Angeles"
        weekly_windows {
            start_time {
                hours = "12"
                minutes = "00"                
            }
            end_time {
                hours = "13"
                minutes = "00"
            }
        }
      }
    }
  }
}