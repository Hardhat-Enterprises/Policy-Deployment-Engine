# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_clouddeploy_automation" "compliant_example_1" {
  location           = "us-central1"
  name              = "compliant_example_1"
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
