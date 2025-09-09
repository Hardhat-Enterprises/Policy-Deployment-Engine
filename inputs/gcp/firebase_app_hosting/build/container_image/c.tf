resource "google_firebase_app_hosting_build" "c" {  
  project = "grounded-jetty-469512-j6"
  build_id = "compliant-build"
  backend = "my-backend"
  location = "australia-southeast2-a"
 
  source {
    container {
      image = "us-docker.pkg.dev/my-project/my-repo/my-app:latest"  # Compliant: Uses Artifact Registry
    }
  }
  
  labels = {
    environment = "production"
    source_type = "artifact-registry"
  }
}