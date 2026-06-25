resource "google_firebase_app_hosting_build" "non_compliant_example_1" {
  project = "grounded-jetty-469512-j6"
  build_id = "non_compliant_example_1"
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
