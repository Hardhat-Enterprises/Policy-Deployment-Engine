resource "google_clouddeploy_delivery_pipeline" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "my-project-name"
  serial_pipeline {
    stages {
      target_id = "target-1"
      strategy {
        standard {
          postdeploy {
            tasks {
              container {
                image   = "us-docker.pkg.dev/my-project/my-repo/my-image:latest"
                command = ["invalid-command"]
              }
            }
          }
        }
      }
    }
  }
}
