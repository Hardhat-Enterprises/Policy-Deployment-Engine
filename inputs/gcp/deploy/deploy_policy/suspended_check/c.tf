# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_deploy_policy" "c" {
  name     = "c"
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
  suspended = false
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