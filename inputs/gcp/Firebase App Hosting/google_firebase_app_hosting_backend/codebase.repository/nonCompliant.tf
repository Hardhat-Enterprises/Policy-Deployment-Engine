resource "google_firebase_app_hosting_backend" "non_compliant_example_1" {
  project = "grounded-jetty-469512-j6"
  location = "australia-southeast2-a"
  backend_id = "non_compliant_example_1"
  app_id = "1:0000000000:web:abc123456789"
  serving_locality = "REGIONAL_STRICT"
  service_account = "firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com"
  
  display_name = "Test Backend"
  environment = "test"
  
  codebase {
    repository = "github.com/user/repo"  # Non-compliant: Direct GitHub URL instead of Google Cloud resource format
    root_directory = "/"  # Non-compliant: Uses root directory which may expose sensitive files
  }
}
