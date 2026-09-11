resource "google_clouddeploy_delivery_pipeline" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  project  = "my-project-name"

  serial_pipeline {
    stages {
      target_id = "target-1"
      strategy {
        canary {
          custom_canary_deployment {
            phase_configs {
              percentage = 50
              phase_id   = "phase-1"
              analysis {
                duration = "300s"
                custom_checks {
                  id = "check-1"
                  task {
                    container {
                      image = "us-docker.pkg.dev/my-project/my-repo/my-image:latest"
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
