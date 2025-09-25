resource "google_clouddeploy_automation" "nc" {
  location           = "us-central1"
  name              = "nc"
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