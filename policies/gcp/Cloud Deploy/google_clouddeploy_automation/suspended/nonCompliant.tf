resource "google_clouddeploy_automation" "non_compliant_example_1" {
  location           = "us-central1"
  name              = "non_compliant_example_1"
  delivery_pipeline = "test-pipeline"
  project           = "my-project-name"
  
  suspended = true
  
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
