resource "google_firebase_app_hosting_backend" "nc" {
  project = "grounded-jetty-469512-j6"
  location = "australia-southeastb-a"
  backend_id = "nc"
  app_id = "1:0000000000:web:abc123456789"
  serving_locality = "GLOBAL_ACCESS" # Non-Compliant: Only REGIONAL_STRICT is approved
  service_account = "firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com"  
}
