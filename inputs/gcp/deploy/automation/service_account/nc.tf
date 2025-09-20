# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_clouddeploy_automation" "nc" {
  location           = "us-central1"
  name              = "nc"
  delivery_pipeline = "test-pipeline"
  project           = "my-project-name"
  
  service_account = "generic-sa@my-project.iam.gserviceaccount.com"
 
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