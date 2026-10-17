resource "google_clouddeploy_automation" "compliant_example_1" {
  location           = "us-central1"
  name              = "compliant_example_1"
  delivery_pipeline = "test-pipeline"
  project           = "my-project-name"
  
  suspended = false
  
  service_account = "automation-sa@my-project.iam.gserviceaccount.com"
  
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
