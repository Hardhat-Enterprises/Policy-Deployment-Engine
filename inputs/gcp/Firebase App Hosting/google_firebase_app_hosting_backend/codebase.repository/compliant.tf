resource "google_firebase_app_hosting_backend" "compliant_example_1" {
  project = "grounded-jetty-469512-j6"
  location = "australia-southeast2-a"
  backend_id = "compliant_example_1"
  app_id = "1:0000000000:web:abc123456789"
  serving_locality = "REGIONAL_STRICT"
  service_account = "firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com"
  
  display_name = "Production Backend"
  environment = "production"
  
  codebase {
    repository = "projects/my-project/locations/australia-southeast2/connections/github-connection/gitRepositoryLinks/my-repo-link"  # Compliant: Proper Google Cloud resource format
    root_directory = "webapp"  # Compliant: Uses specific directory, not root
  }
  
  labels = {
    environment = "production"
    team = "platform"
    source_type = "github"
  }
}
