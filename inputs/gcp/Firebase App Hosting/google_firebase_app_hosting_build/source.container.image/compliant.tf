resource "google_firebase_app_hosting_build" "compliant_example_1" {  
  project = "grounded-jetty-469512-j6"
  build_id = "compliant_example_1"
  backend = "my-backend"
  location = "australia-southeast2-a"
 
  source {
    container {
      image = "au-docker.pkg.dev"  # Compliant: Uses Artifact Registry
    }
  }
  
  labels = {
    environment = "production"
    source_type = "artifact-registry"
  }
}
