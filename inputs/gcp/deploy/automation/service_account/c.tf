# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_automation" "c" {
  location           = "us-central1"
  name              = "c"
  delivery_pipeline = "test-pipeline"
  project           = "my-project-name"
  
  service_account = "dedicated-automation-sa@my-project.iam.gserviceaccount.com"
  
  selector {
    targets {
      id = "*"
    }
  }
  
  rules {
    promote_release_rule {
      id = "promote-release"
    }
  }
}