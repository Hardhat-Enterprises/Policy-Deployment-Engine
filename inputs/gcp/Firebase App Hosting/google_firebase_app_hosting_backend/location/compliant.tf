resource "google_firebase_app_hosting_backend" "compliant_example_1" {
  project = "grounded-jetty-469512-j6"
  location = "australia-southeast2-a" #Compliant: Uses location as approved
  backend_id = "compliant_example_1"
  app_id = "1:0000000000:web:abc123456789"
  serving_locality = "REGIONAL_STRICT"
  service_account = "firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com"
}
