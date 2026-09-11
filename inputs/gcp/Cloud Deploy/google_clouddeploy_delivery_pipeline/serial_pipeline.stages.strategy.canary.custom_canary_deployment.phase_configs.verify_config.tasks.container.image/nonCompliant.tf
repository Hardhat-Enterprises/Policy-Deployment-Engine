resource "google_clouddeploy_delivery_pipeline" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
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
              verify_config {
                tasks {
                  container {
                    image = "invalid-image"
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
