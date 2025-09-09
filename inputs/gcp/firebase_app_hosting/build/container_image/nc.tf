resource "google_firebase_app_hosting_build" "nc" {
  project = "grounded-jetty-469512-j6"
  build_id = "non-compliant-build"
  backend = "my-backend"
  location = "australia-southeast2-a"
  
  source {
    container {
      image = "docker.io/nginx:latest"  # Non-compliant: Uses public Docker Hub
    }
  }
  
  labels = {
    environment = "test"
    source_type = "docker-hub"
  }
}