# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_delivery_pipeline" "c" {
  name     = "c"
  location = "us-central1"
  project  = "my-project-name"
  
  serial_pipeline {
    stages {
      target_id = "dev"
      profiles  = ["dev"]
    }
    stages {
      target_id = "staging" 
      profiles  = ["staging"]
    }
    stages {
      target_id = "prod"
      profiles  = ["prod"]
    }
  }
}
