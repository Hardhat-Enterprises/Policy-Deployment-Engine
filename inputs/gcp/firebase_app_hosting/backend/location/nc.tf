resource "google_firebase_app_hosting_backend" "nc" {
  project = "grounded-jetty-469512-j6"
  location = "africa-south1-a" #Non-Compliant: Not in the whitelist
  backend_id = "non-compliant-backend"
  app_id = "1:0000000000:web:abc123456789"
  serving_locality = "REGIONAL_STRICT"  
  service_account = "firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com"  
}
