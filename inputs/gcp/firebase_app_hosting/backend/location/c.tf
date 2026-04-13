resource "google_firebase_app_hosting_backend" "c" {
  project          = "grounded-jetty-469512-j6"
  location         = "australia-southeast2-a" #Compliant: Uses location as approved
  backend_id       = "c"
  app_id           = "1:0000000000:web:abc123456789"
  serving_locality = "REGIONAL_STRICT"
  service_account  = "firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com"
}
