resource "google_firebase_app_hosting_default_domain" "c" {
  project = "grounded-jetty-469512-j6"
  location = "australia-southeast1"
  backend = "compliant-backend"
  domain_id = "compliant-backend--my-project-name.australia-southeast1.hosted.app"  # Compliant: Follows required format
  
  disabled = false
}